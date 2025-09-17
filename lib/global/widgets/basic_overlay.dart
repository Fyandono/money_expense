import 'package:flutter/material.dart';
import 'package:money_expense/global/widgets/header_exit_modal.dart';

class MyBasicOverlay extends StatelessWidget {
  final String? title;
  final Widget widget;
  const MyBasicOverlay({this.title, required this.widget, super.key});

  @override
  build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [if (title != null) HeaderExitModal(title: title!), widget],
      ),
    );
  }
}
