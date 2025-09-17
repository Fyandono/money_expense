import 'package:money_expense/features/form/data/models/expense.dart';

class CategorizedExpense {
  final Expense expense;
  final int category;

  CategorizedExpense({
    required this.expense,
    required this.category,
  });
}
