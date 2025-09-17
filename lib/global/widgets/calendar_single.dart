import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense/global/color/colors.dart';
import 'package:money_expense/global/widgets/basic_overlay.dart';
import 'package:money_expense/global/widgets/border.dart';
import 'package:money_expense/global/widgets/text_button.dart';
import 'package:money_expense/router/router.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarSingleWidget extends StatelessWidget {
  final String date;
  final bool enablePastDates;
  final bool enableFutureDates;
  final DateTime? minDate;
  final bool? useCountWeekdays;
  final Function(String date) onPressed;
  const CalendarSingleWidget({
    required this.date,
    required this.onPressed,
    this.enablePastDates = false,
    this.enableFutureDates = true,
    this.minDate,
    this.useCountWeekdays,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String localDate = '';

    void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      if (args.value != null) {
        final DateTime dateSelection = DateTime(
          args.value.year,
          args.value.month,
          args.value.day,
        );

        localDate = dateSelection.toIso8601String();
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: SfDateRangePicker(
            enablePastDates: enablePastDates,
            minDate: minDate,
            maxDate: enableFutureDates ? null : DateTime.now(),
            onSelectionChanged: onSelectionChanged,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            selectionColor: AppColors.blueBackground,
            todayHighlightColor: AppColors.blueBorder,
            selectionTextStyle: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            rangeTextStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.blueText,
            ),
            selectionMode: DateRangePickerSelectionMode.single,
            initialSelectedDate: date.isNotEmpty ? DateTime.parse(date) : null,
          ),
        ),
        const MyBorder(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: MyTextButton(
            style: buttonPrimaryBlue,
            text: 'Simpan',
            onPressed: () {
              if (localDate.isEmpty) {
                onPressed(date);
              } else {
                onPressed(localDate);
              }
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}

void showModalCalendarSingle({
  required String date,
  required bool enablePastDates,
  required bool enableFutureDates,
  required Function(String date) method,
  DateTime? minDate,
}) {
  final context = navigatorKey.currentContext!;
  showDialog(
    context: context,
    builder:
        (_) => MyBasicOverlay(
          title: 'Pilih Tanggal',
          widget: CalendarSingleWidget(
            date: date,
            enablePastDates: enablePastDates,
            enableFutureDates: enableFutureDates,
            onPressed: method,
            minDate: minDate,
          ),
        ),
  );
}
