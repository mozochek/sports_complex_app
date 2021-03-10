import 'package:flutter/material.dart';

extension TimeOfDayX on TimeOfDay {
  String get asFormattedString => '$hour:${minute < 10 ? '0$minute' : '$minute'}';

  Map<String, dynamic> toJson() => <String, dynamic>{
    'hour': hour,
    'minute': minute,
  };
}