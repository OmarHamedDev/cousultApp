import 'package:intl/intl.dart';

class HandleFormData {
  String getDayNumber(String dateStr) => DateFormat('dd').format(DateTime.parse(dateStr));
  String getMonthName(String dateStr) => DateFormat('MMM', 'ar').format(DateTime.parse(dateStr));
  String getTime(String dateStr) => DateFormat('jm', 'ar').format(DateTime.parse(dateStr).toLocal());

  static String formatFullDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr).toLocal();
    return DateFormat('d MMMM yyyy', 'ar').format(dateTime);
  }

  static String formatTime(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr).toLocal();
    return DateFormat('hh:mm a', 'ar').format(dateTime);
  }

  static String formatNotificationDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr).toLocal();
    String date = DateFormat('d MMMM yyyy', 'ar').format(dateTime);
    String time = DateFormat('h:mm a', 'ar').format(dateTime);
    return "$date • $time";
  }
}