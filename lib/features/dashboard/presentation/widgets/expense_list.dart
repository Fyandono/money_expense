import 'package:flutter/material.dart';
import 'package:money_expense/features/dashboard/presentation/widgets/expense_item.dart';
import 'package:money_expense/features/dashboard/data/models/categorized_expense.dart';
import 'package:money_expense/global/widgets/text.dart';

class CategorizedExpenseList extends StatelessWidget {
  final List<CategorizedExpense> categorizedExpenses;

  const CategorizedExpenseList({super.key, required this.categorizedExpenses});

  @override
  Widget build(BuildContext context) {
    if (categorizedExpenses.isEmpty) {
      return const Center(
        child: MyText(
          text: "Belum Ada Expense!",
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return ListView.builder(
      clipBehavior: Clip.none,
      itemCount: categorizedExpenses.length,
      itemBuilder: (context, index) {
        return MyExpenseItem(categorized: categorizedExpenses[index]);
      },
    );
  }
}
