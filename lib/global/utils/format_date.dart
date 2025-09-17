import 'package:intl/intl.dart';

String formatDate(String dateStr, String formatPattern) {
  try {
    DateTime date = DateTime.parse(dateStr);
    String formattedDate = DateFormat(formatPattern, 'id_ID').format(date);
    return formattedDate;
  } catch (e) {
    return dateStr;
  }
}
