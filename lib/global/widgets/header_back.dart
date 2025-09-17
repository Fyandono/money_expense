import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense/global/color/colors.dart';
import 'package:money_expense/global/widgets/text.dart';

class HeaderBack extends StatelessWidget {
  final String title;
  final Widget? widget;
  const HeaderBack({required this.title, this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.greyIcon,
            ),
            const SizedBox(width: 16),
            MyText(text: title, fontSize: 16, fontWeight: FontWeight.w600),
            const Spacer(),
            if (widget != null) widget!,
          ],
        ),
      ),
    );
  }
}
