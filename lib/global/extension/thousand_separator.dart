import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandSeparator extends TextInputFormatter {
  final int decimalDigits;

  ThousandSeparator({this.decimalDigits = 0}) : assert(decimalDigits >= 0);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    // Remove leading zeros
    while (newText.length > 1 && newText[0] == '0') {
      newText = newText.substring(1);
    }

    // Handle case where input is empty or zero
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    int intValue = int.parse(newText);
    final numberFormat = NumberFormat("#,##0", "id_IDR");

    String newString = numberFormat.format(intValue);

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

