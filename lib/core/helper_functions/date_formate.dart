import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

String formatDate(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDate = DateFormat('yyyy-MM-dd', 'en').format(dateTime);
  return formattedDate;
}

String formatDate2(String dateTimeString) {
  DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
  DateTime dateTime = inputFormat.parse(dateTimeString);
  DateFormat outputFormat = DateFormat('yyyy-MM-dd');
  String formattedDate = outputFormat.format(dateTime);
  return formattedDate;
}

String formatTime(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  return DateFormat('HH:mm', 'en').format(dateTime);
}

DateTime formatTimeDateTime(String dateTimeString) {
  return DateTime.parse(dateTimeString);
}

String getCurrentTime() {
  DateTime now = DateTime.now();
  String formattedTime = DateFormat('HH:mm:ss', 'en').format(now);

  return formattedTime;
}
