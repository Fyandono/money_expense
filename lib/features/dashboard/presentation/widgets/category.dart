import 'package:flutter/material.dart';
import 'package:money_expense/features/form/data/models/expense_category.dart';
import 'package:money_expense/global/color/colors.dart';
import 'package:money_expense/global/utils/format_rupiah.dart';
import 'package:money_expense/global/widgets/text.dart';

class CategoryExpenseWidget extends StatelessWidget {
  final ExpenseCategory category;
  final double nominal;

  const CategoryExpenseWidget({
    super.key,
    required this.category,
    required this.nominal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(category.asset, width: 32),
          const SizedBox(height: 12),
          MyText(
            text: category.value,
            fontSize: 12,
            color: AppColors.greyText2,
          ),
          const SizedBox(height: 12),
          MyText(
            text: formatRp(value: nominal),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
