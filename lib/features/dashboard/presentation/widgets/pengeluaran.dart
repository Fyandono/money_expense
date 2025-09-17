import 'package:flutter/material.dart';
import 'package:money_expense/global/color/colors.dart';
import 'package:money_expense/global/utils/format_rupiah.dart';
import 'package:money_expense/global/widgets/text.dart';

class PengeluaranTodayOrMonth extends StatelessWidget {
  final String keterangan;
  final double nominal;
  final Color color;
  const PengeluaranTodayOrMonth({
    super.key,
    required this.keterangan,
    required this.nominal,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: keterangan,
            fontSize: 12,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 16),
          MyText(
            text: formatRp(value: nominal),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
