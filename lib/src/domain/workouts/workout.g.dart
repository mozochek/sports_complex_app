// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return Workout(
    id: json['id'] as String,
    name: json['name'] as String,
    hall: json['hall'] == null
        ? null
        : Hall.fromJson(json['hall'] as Map<String, dynamic>),
    coach: json['coach'] == null
        ? null
        : Coach.fromJson(json['coach'] as Map<String, dynamic>),
    date:
        dateTimeToDateConverter.fromJson(json['date'] as Map<String, dynamic>),
    startTime:
        timeOfDayConverter.fromJson(json['startTime'] as Map<String, dynamic>),
    endTime:
        timeOfDayConverter.fromJson(json['endTime'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hall': instance.hall?.toJson(),
      'coach': instance.coach?.toJson(),
      'date': dateTimeToDateConverter.toJson(instance.date),
      'startTime': timeOfDayConverter.toJson(instance.startTime),
      'endTime': timeOfDayConverter.toJson(instance.endTime),
    };
