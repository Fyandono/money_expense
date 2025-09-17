import 'package:money_expense/features/form/data/models/expense_category.dart';
import 'package:money_expense/global/utils/format_date.dart';
import 'package:money_expense/global/utils/format_rupiah.dart';

class Expense {
  final int? id;
  final String? expense;
  final ExpenseCategory? category;
  final String? date;
  final double? nominal;

  const Expense({
    this.id,
    this.expense,
    this.category,
    this.date,
    this.nominal,
  });

  Expense copyWith({
    String? expense,
    ExpenseCategory? category,
    String? date,
    double? nominal,
  }) {
    return Expense(
      id: id,
      expense: expense ?? this.expense,
      category: category ?? this.category,
      date: date ?? this.date,
      nominal: nominal ?? this.nominal,
    );
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int,
      expense: map['expense'] as String?,
      category: ExpenseCategory.getCategoryById(map['category_id'] as int?),
      date: map['date'] as String?,
      nominal:
          map['nominal'] is int
              ? (map['nominal'] as int).toDouble()
              : map['nominal'] as double?,
    );
  }

  Map<String, dynamic> toMap() {
    String finalDate;
    if (date != null) {
      try {
        final parsedDate = DateTime.parse(date!);
        final now = DateTime.now();
        final withTime = DateTime(
          parsedDate.year,
          parsedDate.month,
          parsedDate.day,
          now.hour,
          now.minute,
          now.second,
        );
        finalDate = withTime.toIso8601String();
      } catch (_) {
        finalDate = DateTime.now().toIso8601String();
      }
    } else {
      finalDate = DateTime.now().toIso8601String();
    }

    return {
      'id': id,
      'expense': expense,
      'category_id': category?.id,
      'date': finalDate,
      'nominal': nominal,
    };
  }

  String? get dateFormatted {
    if (date != null) {
      return formatDate(date!, "dd MMMM yyyy");
    }
    return null;
  }

  String? get nominalFormatted {
    if (nominal != null) {
      return formatRp(value: nominal!);
    } else {
      return null;
    }
  }
}
