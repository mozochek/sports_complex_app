import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/core/repositories/i_cud_repository.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';

abstract class IWorkoutFormBloc extends IFormBloc<Workout> {
  IWorkoutFormBloc(
    ICudRepository<Workout> repository,
    Workout? workout,
    FormBlocPurpose? purpose,
  ) : super(
          repository: repository,
          obj: workout,
          purpose: purpose,
        );

  Stream<String> get workoutName;

  void changeWorkoutName(String workoutName);

  Stream<Hall> get workoutHall;

  void changeWorkoutHall(Hall? hall);

  Stream<Coach> get workoutCoach;

  void changeWorkoutCoach(Coach? coach);

  Stream<DateTime?> get workoutDate;

  void changeWorkoutDate(DateTime? date);

  Stream<TimeOfDay?> get workoutStartTime;

  void changeWorkoutStartTime(TimeOfDay? startTime);

  Stream<TimeOfDay?> get workoutEndTime;

  void changeWorkoutEndTime(TimeOfDay? endTime);
}
