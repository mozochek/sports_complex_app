import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/time_of_day_x.dart';

class TimeOfDayConverter
    implements JsonConverter<TimeOfDay?, Map<String, dynamic>?> {
  const TimeOfDayConverter();

  @override
  TimeOfDay? fromJson(Map<String, dynamic>? json) => TimeOfDay(
    hour: json?['hour'] as int,
    minute: json?['minute'] as int,
  );

  @override
  Map<String, dynamic>? toJson(TimeOfDay? time) => time?.toJson();
}