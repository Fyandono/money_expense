import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense/global/color/colors.dart';
import 'package:money_expense/global/widgets/border.dart';
import 'package:money_expense/global/widgets/text.dart';

class HeaderExitModal extends StatelessWidget {
  final String title;

  const HeaderExitModal({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(text: title, fontSize: 16, fontWeight: FontWeight.w600),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyBorder),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: AppColors.greyIcon,
                  ),
                ),
              ),
            ],
          ),
        ),
        const MyBorder(padding: EdgeInsets.only(top: 8)),
      ],
    );
  }
}
