import 'package:money_expense/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class FormRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> insertExpense(Map<String, dynamic> data) async {
    final Database db = await _dbHelper.database;
    return await db.insert(
      'expenses',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
