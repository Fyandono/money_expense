import 'package:money_expense/features/dashboard/data/models/categorized_expense.dart';
import 'package:money_expense/features/form/data/models/expense.dart';

List<CategorizedExpense> categorizeExpensesSingleList(
  DateTime now,
  List<Expense> expenseList,
) {
  if (expenseList.isEmpty) {
    return [];
  }

  List<CategorizedExpense> categorizedList = [];
  DateTime today = DateTime(now.year, now.month, now.day);

  DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
  DateTime endOfWeek = startOfWeek.add(Duration(days: 6 - today.weekday + 7));

  DateTime startOfMonth = DateTime(today.year, today.month, 1);
  DateTime endOfMonth = DateTime(today.year, today.month + 1, 0, 23, 59, 59);

  DateTime? latestToday;
  DateTime? latestThisWeek;
  DateTime? latestThisMonth;
  // check if its today?
  bool isToday(DateTime date) {
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  for (Expense expense in expenseList) {
    DateTime expenseDate = DateTime.parse(expense.date!);
    // latest today
    if (isToday(expenseDate) && latestToday == null) {
      latestToday = expenseDate;
      categorizedList.add(CategorizedExpense(expense: expense, category: 1));
    } else if (
    // latest this week
    !isToday(expenseDate) &&
        expenseDate.isBefore(endOfWeek) &&
        expenseDate.isAfter(startOfWeek) &&
        latestThisWeek == null) {
      // If it's in this week and the latest this week, set category to 2
      latestThisWeek = expenseDate;
      categorizedList.add(CategorizedExpense(expense: expense, category: 2));
    } else if (
    // latest this month
    !isToday(expenseDate) &&
        expenseDate.isBefore(startOfWeek) &&
        expenseDate.isAfter(startOfMonth) &&
        expenseDate.isBefore(endOfMonth) &&
        latestThisMonth == null) {
      // If it's in this month and the latest this month, set category to 3
      latestThisMonth = expenseDate;
      categorizedList.add(CategorizedExpense(expense: expense, category: 3));
    } else {
      categorizedList.add(CategorizedExpense(expense: expense, category: 0));
    }
  }

  return categorizedList;
}
