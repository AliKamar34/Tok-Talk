import 'package:intl/intl.dart';

String getFormattedDate(DateTime dateTime) {
  DateTime now = DateTime.now();
  DateTime yesterday = now.subtract(const Duration(days: 1));

  if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day) {
    return 'Today';
  } else if (dateTime.year == yesterday.year &&
      dateTime.month == yesterday.month &&
      dateTime.day == yesterday.day) {
    return 'Yesterday';
  } else {
    return DateFormat('yy/MM/dd').format(dateTime);
  }
}
  // String formattedTime = DateFormat('h:mm a').format(lastMessage!.dateTime);

  //   String formattedDays = getFormattedDate(lastMessage!.dateTime);