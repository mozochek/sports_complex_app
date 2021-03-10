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
    @required this.id,
    this.name,
    this.hall,
    this.coach,
    this.date,
    this.startTime,
    this.endTime,
  });

  factory Workout.empty() => Workout(
        id: Uuid().v4(),
        name: '',
        hall: Hall.empty(),
        coach: Coach.empty(),
        date: DateTime.now(),
        startTime: TimeOfDay.now(),
        endTime: TimeOfDay.now(),
      );

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);

  factory Workout.fromFirestore(QueryDocumentSnapshot doc) =>
      Workout.fromJson(doc.data());

  final String id;
  String name;
  Hall hall;
  Coach coach;
  @dateTimeToDateConverter
  DateTime date;
  @timeOfDayConverter
  TimeOfDay startTime;
  @timeOfDayConverter
  TimeOfDay endTime;

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}
