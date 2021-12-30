import 'package:intl/intl.dart';

class AppDateUtils {
  static const dateFormat = "yyyy-MM-dd";

  static DateTime getCurrentDate() {
    return DateTime.now();
  }

  static String format(DateTime time) {
    final DateFormat formatter = DateFormat(dateFormat);
    return formatter.format(time);
  }
}
