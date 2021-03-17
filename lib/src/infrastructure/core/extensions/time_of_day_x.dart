import 'package:flutter/material.dart';

extension TimeOfDayX on TimeOfDay {
  String get asFormattedString =>
      '$hour:${minute < 10 ? '0$minute' : '$minute'}';

  Map<String, dynamic> toJson() => <String, dynamic>{
        'hour': hour,
        'minute': minute,
      };

  TimeOfDay subtract(TimeOfDay other) {
    var resultHour = hour - other.hour;
    var resultMinute = minute - other.minute;

    if (minute < other.minute) {
      resultHour--;
      resultMinute = other.minute - minute;
    }

    return TimeOfDay(
      hour: resultHour,
      minute: resultMinute,
    );
  }
}
