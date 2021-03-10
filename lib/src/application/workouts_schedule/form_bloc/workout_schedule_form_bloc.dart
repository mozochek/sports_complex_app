import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';

@Injectable(
  as: IWorkoutFormBloc,
  env: [Environment.dev, Environment.prod],
)
// TODO: REFACTOR LIKE IN SIGN/SIGN UP BLOC'S
class WorkoutScheduleFormBloc extends IWorkoutFormBloc {
  WorkoutScheduleFormBloc(
    IWorkoutsFirestoreCrudRepository repository, {
    @factoryParam this.workout,
    @factoryParam FormBlocPurpose purpose = FormBlocPurpose.creating,
  }) : super(repository, workout, purpose);

  factory WorkoutScheduleFormBloc.forCreating() => getIt<IWorkoutFormBloc>(
        param1: Workout.empty(),
        param2: FormBlocPurpose.creating,
      ) as WorkoutScheduleFormBloc;

  factory WorkoutScheduleFormBloc.forEditing(Workout workout) {
    final bloc = getIt<IWorkoutFormBloc>(
      param1: workout,
      param2: FormBlocPurpose.editing,
    ) as WorkoutScheduleFormBloc;

    bloc
        .changeWorkoutName(workout.name)
        .changeWorkoutHall(workout.hall)
        .changeWorkoutCoach(workout.coach)
        .changeWorkoutDate(workout.date)
        .changeWorkoutStartTime(workout.startTime)
        .changeWorkoutEndTime(workout.endTime);

    return bloc;
  }

  final Workout workout;

  final _workoutName = BehaviorSubject<String>();
  final _workoutHall = BehaviorSubject<Hall>();
  final _workoutCoach = BehaviorSubject<Coach>();
  final _workoutDate = BehaviorSubject<DateTime>();
  final _workoutStartTime = BehaviorSubject<TimeOfDay>();
  final _workoutEndTime = BehaviorSubject<TimeOfDay>();
  final _isValid = BehaviorSubject<bool>()..value = false;

  @override
  Stream<String> get workoutName =>
      _workoutName.stream.transform(_validateName);

  StreamTransformer<String, String> get _validateName =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawName, sink) {
          final name = rawName.trim();
          if (name.length > 2) {
            workout.name = name;
            sink.add(name);
          } else {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Название должно состоять из 3 или более символов');
          }
        },
      );

  @override
  Function(String) get changeWorkoutName => _workoutName.sink.add;

  @override
  Stream<Hall> get workoutHall => _workoutHall.stream.transform(_validateHall);

  StreamTransformer<Hall, Hall> get _validateHall =>
      StreamTransformer.fromHandlers(
        handleData: (hall, sink) {
          if (hall != null) {
            workout.hall = hall;
            sink.add(hall);
          } else {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutHall(Hall hall) => _workoutHall.sink.add(hall);

  @override
  Stream<Coach> get workoutCoach =>
      _workoutCoach.stream.transform(_validateCoach);

  StreamTransformer<Coach, Coach> get _validateCoach =>
      StreamTransformer.fromHandlers(
        handleData: (coach, sink) {
          if (coach != null) {
            workout.coach = coach;
            sink.add(coach);
          } else {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutCoach(Coach coach) => _workoutCoach.sink.add(coach);

  @override
  Stream<DateTime> get workoutDate =>
      _workoutDate.stream.transform(_validateDate);

  StreamTransformer<DateTime, DateTime> get _validateDate =>
      StreamTransformer.fromHandlers(
        handleData: (date, sink) {
          if (date != null) {
            workout.date = date;
            sink.add(date);
          } else {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutDate(DateTime date) => _workoutDate.sink.add(date);

  @override
  Stream<TimeOfDay> get workoutStartTime =>
      _workoutStartTime.stream.transform(_validateStartTime);

  StreamTransformer<TimeOfDay, TimeOfDay> get _validateStartTime =>
      StreamTransformer.fromHandlers(
        handleData: (startTime, sink) {
          if (startTime != null) {
            workout.startTime = startTime;
            sink.add(startTime);
          } else {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutStartTime(TimeOfDay startTime) =>
      _workoutStartTime.sink.add(startTime);

  @override
  Stream<TimeOfDay> get workoutEndTime =>
      _workoutEndTime.stream.transform(_validateEndTime);

  StreamTransformer<TimeOfDay, TimeOfDay> get _validateEndTime =>
      StreamTransformer.fromHandlers(
        handleData: (endTime, sink) {
          if (endTime != null) {
            workout.endTime = endTime;
            sink.add(endTime);
          } else {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutEndTime(TimeOfDay endTime) =>
      _workoutEndTime.sink.add(endTime);

  @override
  bool get isObjValid => _isValid.value;

  @override
  Stream<bool> get isObjValidStream => Rx.combineLatest6<String, Hall, Coach,
          DateTime, TimeOfDay, TimeOfDay, bool>(
        workoutName,
        workoutHall,
        workoutCoach,
        workoutDate,
        workoutStartTime,
        workoutEndTime,
        (a, b, c, d, e, f) {
          _isValid.sink.add(true);
          return true;
        },
      );

  @override
  Future<void> dispose() async {
    await _workoutName.close();
    await _workoutHall.close();
    await _workoutCoach.close();
    await _workoutDate.close();
    await _workoutStartTime.close();
    await _workoutEndTime.close();
    await _isValid.close();
  }
}
