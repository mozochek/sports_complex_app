import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/infrastructure/core/json_converters/json_converters.dart';
import 'package:uuid/uuid.dart';

part 'workout.g.dart';

@JsonSerializable()
class Workout {
  Workout({
    required this.id,
    required this.name,
    required this.hall,
    required this.coach,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory Workout.empty() => Workout(
        id: const Uuid().v4(),
        name: '',
        hall: Hall.empty(),
        coach: Coach.empty(),
        date: null,
        startTime: null,
        endTime: null,
      );

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);

  factory Workout.fromFirestore(QueryDocumentSnapshot doc) =>
      Workout.fromJson(doc.data()!);

  final String id;
  String name;
  Hall hall;
  Coach coach;
  @dateTimeToDateConverter
  DateTime? date;
  @timeOfDayConverter
  TimeOfDay? startTime;
  @timeOfDayConverter
  TimeOfDay? endTime;

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);

  Workout copy() => Workout(
        id: id,
        name: name,
        hall: hall,
        coach: coach,
        date: date,
        startTime: startTime,
        endTime: endTime,
      );
}
