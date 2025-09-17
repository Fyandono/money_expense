import 'package:money_expense/database/database_helper.dart';
import 'package:money_expense/features/form/data/models/expense.dart';
import 'package:money_expense/features/form/data/models/expense_category.dart';

class DashboardRepository {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<double> getPengeluaranHariIni() async {
    final db = await dbHelper.database;
    final now = DateTime.now();

    // awal dan akhir hari ini
    final startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    final startStr = startOfDay.toIso8601String();
    final endStr = endOfDay.toIso8601String();

    final result = await db.rawQuery(
      '''
    SELECT SUM(nominal) as total 
    FROM expenses 
    WHERE date BETWEEN ? AND ?
    ''',
      [startStr, endStr],
    );

    return (result.first['total'] as num?)?.toDouble() ?? 0.0;
  }

  Future<double> getPengeluaranBulanIni() async {
    final db = await dbHelper.database;
    final now = DateTime.now();
    final bulanAwal = "${now.year}-${now.month.toString().padLeft(2, '0')}-01";

    final result = await db.rawQuery(
      "SELECT SUM(nominal) as total FROM expenses WHERE date >= ?",
      [bulanAwal],
    );

    return (result.first['total'] as num?)?.toDouble() ?? 0.0;
  }

  Future<Map<ExpenseCategory, double>>
  getPengeluaranBerdasarkanKategori() async {
    final db = await dbHelper.database;

    final result = await db.rawQuery("""
    SELECT category_id, SUM(nominal) as total 
    FROM expenses 
    GROUP BY category_id
  """);

    final Map<int, double> temp = {};
    for (final row in result) {
      final int? categoryId = row['category_id'] as int?;
      final double total = (row['total'] as num?)?.toDouble() ?? 0.0;
      if (categoryId != null) {
        temp[categoryId] = total;
      }
    }

    final Map<ExpenseCategory, double> map = {};
    for (final category in masterCategories) {
      map[category] = temp[category.id] ?? 0.0;
    }

    return map;
  }

  Future<List<Expense>> getAllExpenses() async {
    final db = await dbHelper.database;

    final result = await db.query('expenses', orderBy: 'date DESC');

    return result.map((row) => Expense.fromMap(row)).toList();
  }
}
