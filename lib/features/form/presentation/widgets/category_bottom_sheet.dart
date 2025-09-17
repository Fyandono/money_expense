import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense/features/form/data/models/expense_category.dart';
import 'package:money_expense/global/widgets/text.dart';
import 'package:money_expense/router/router.dart';

class CategoryBottomSheet extends StatelessWidget {
  final List<ExpenseCategory> categories;
  final Function(ExpenseCategory category) onTap;

  const CategoryBottomSheet({
    super.key,
    required this.categories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Judul
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: "Pilih Kategori",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.pop(),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Grid kategori
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // crossAxisSpacing: 12,
              // mainAxisSpacing: 12,
              // childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  onTap(category);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(category.asset, width: 32, height: 32),
                    const SizedBox(height: 8),
                    MyText(
                      text: category.value,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Future<void> showCategoryBottomSheet({
  required List<ExpenseCategory> categories,
  required Function(ExpenseCategory category) onTap,
}) async {
  final context = navigatorKey.currentContext!;
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return CategoryBottomSheet(categories: categories, onTap: onTap);
    },
  );
}
