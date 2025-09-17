import 'package:flutter/material.dart';
import 'package:money_expense/features/dashboard/data/models/categorized_expense.dart';
import 'package:money_expense/global/color/colors.dart';
import 'package:money_expense/global/widgets/text.dart';

class MyExpenseItem extends StatelessWidget {
  final CategorizedExpense categorized;

  const MyExpenseItem({super.key, required this.categorized});

  @override
  Widget build(BuildContext context) {
    final expense = categorized.expense;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (categorized.category == 1)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: MyText(
              text: 'Hari Ini',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        if (categorized.category == 2)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: MyText(
              text: 'Minggu Ini',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        if (categorized.category == 3)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: MyText(
              text: 'Bulan Ini',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              if (expense.category != null)
                Image.asset(expense.category!.asset, width: 40, height: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: expense.expense ?? "-",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 4),
                    MyText(
                      text: expense.dateFormatted ?? "",
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              MyText(
                text: expense.nominalFormatted ?? "Rp0",
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
