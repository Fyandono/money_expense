import 'package:flutter/material.dart';
import 'package:money_expense/global/color/colors.dart';

class MyBorder extends StatelessWidget {
  final double thickness;
  final EdgeInsetsGeometry padding;
  const MyBorder({
    this.thickness = 1,
    this.padding = const EdgeInsets.all(0),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        height: 0,
        indent: 0,
        color: AppColors.greyBorder,
        thickness: thickness,
      ),
    );
  }
}
