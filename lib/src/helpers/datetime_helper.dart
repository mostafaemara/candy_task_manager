import 'package:intl/intl.dart';

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isAfterToday() {
    final now = DateTime.now();
    return now.day < day && now.month == month && now.year == year;
  }

  bool isSameDateAs(DateTime dateTime) {
    return dateTime.day == day &&
        dateTime.month == month &&
        dateTime.year == year;
  }

  bool isTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  String customFormate() {
    return DateFormat("EEE,MMM,dd,yyyy").format(this);
  }
}
