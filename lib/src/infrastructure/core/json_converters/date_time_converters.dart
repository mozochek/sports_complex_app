import 'package:json_annotation/json_annotation.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/date_time_x.dart';

class DateTimeToDateConverter
    implements JsonConverter<DateTime?, Map<String, dynamic>?> {
  const DateTimeToDateConverter();

  @override
  DateTime? fromJson(Map<String, dynamic>? json) => DateTime(
        json?['year'] as int,
        json?['month'] as int,
        json?['day'] as int,
      );

  @override
  Map<String, dynamic>? toJson(DateTime? date) => date?.onlyDateToJson();
}

class DateTimeConverter
    implements JsonConverter<DateTime?, Map<String, dynamic>?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(Map<String, dynamic>? json) => DateTime(
        json?['year'] as int,
        json?['month'] as int,
        json?['day'] as int,
        json?['hour'] as int,
        json?['minute'] as int,
      );

  @override
  Map<String, dynamic>? toJson(DateTime? date) => date?.dateAndTimeToJson();
}
