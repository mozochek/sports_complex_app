import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/core/i_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';

@Injectable(
  as: IWorkoutFormBloc,
  env: [Environment.dev, Environment.prod],
)
class WorkoutFormBloc extends IWorkoutFormBloc with WorkoutFormValidator {
  WorkoutFormBloc(
    IWorkoutsFirestoreCrudRepository repository, {
    @factoryParam Workout? workout,
    @factoryParam FormBlocPurpose? purpose,
  }) : super(repository, workout, purpose = FormBlocPurpose.creating);

  factory WorkoutFormBloc.forCreating() => getIt<IWorkoutFormBloc>(
        param1: Workout.empty(),
        param2: FormBlocPurpose.creating,
      ) as WorkoutFormBloc;

  factory WorkoutFormBloc.forEditing(Workout workout) =>
      getIt<IWorkoutFormBloc>(
        param1: workout.copy(),
        param2: FormBlocPurpose.editing,
      ) as WorkoutFormBloc
        ..changeWorkoutName(workout.name)
        ..changeWorkoutHall(workout.hall)
        ..changeWorkoutCoach(workout.coach)
        ..changeWorkoutDate(workout.date)
        ..changeWorkoutStartTime(workout.startTime)
        ..changeWorkoutEndTime(workout.endTime);

  final _workoutName = BehaviorSubject<String>();
  final _workoutHall = BehaviorSubject<Hall>();
  final _workoutCoach = BehaviorSubject<Coach>();
  final _workoutDate = BehaviorSubject<DateTime?>();
  final _workoutStartTime = BehaviorSubject<TimeOfDay?>();
  final _workoutEndTime = BehaviorSubject<TimeOfDay?>();
  final _isValid = BehaviorSubject<bool>()..add(false);

  @override
  Stream<String> get workoutName =>
      _workoutName.stream.transform(_validateName);

  StreamTransformer<String, String> get _validateName =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (rawName, sink) {
          final name = rawName.trim();
          obj!.name = name;
          sink.add(name);
          if (!isWorkoutNameCorrect(name)) {
            // TODO: add localization
            sink.addError('Название должно состоять из 3 или более символов');
          }
        },
      );

  @override
  void changeWorkoutName(String workoutName) =>
      _workoutName.sink.add(workoutName);

  @override
  Stream<Hall> get workoutHall => _workoutHall.stream.transform(_validateHall);

  StreamTransformer<Hall, Hall> get _validateHall =>
      StreamTransformer.fromHandlers(
        handleData: (hall, sink) {
          obj!.hall = hall;
          sink.add(hall);
          if (!isWorkoutHallCorrect(hall)) {
            // TODO: add localization
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutHall(Hall? hall) =>
      _workoutHall.sink.add(hall ?? Hall.empty());

  @override
  Stream<Coach> get workoutCoach =>
      _workoutCoach.stream.transform(_validateCoach);

  StreamTransformer<Coach, Coach> get _validateCoach =>
      StreamTransformer.fromHandlers(
        handleData: (coach, sink) {
          obj!.coach = coach;
          sink.add(coach);
          if (!isWorkoutCoachCorrect(coach)) {
            // TODO: add localization
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutCoach(Coach? coach) =>
      _workoutCoach.sink.add(coach ?? Coach.empty());

  @override
  Stream<DateTime?> get workoutDate =>
      _workoutDate.stream.transform(_validateDate);

  StreamTransformer<DateTime?, DateTime?> get _validateDate =>
      StreamTransformer.fromHandlers(
        handleData: (date, sink) {
          obj!.date = date;
          sink.add(date);
          if (!isWorkoutDateCorrect(date)) {
            // TODO: add localization
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutDate(DateTime? date) => _workoutDate.sink.add(date);

  @override
  Stream<TimeOfDay?> get workoutStartTime =>
      _workoutStartTime.stream.transform(_validateStartTime);

  StreamTransformer<TimeOfDay?, TimeOfDay?> get _validateStartTime =>
      StreamTransformer.fromHandlers(
        handleData: (startTime, sink) {
          obj!.startTime = startTime;
          sink.add(startTime);
          if (!isWorkoutStartTimeCorrect(startTime)) {
            // TODO: add localization
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutStartTime(TimeOfDay? startTime) =>
      _workoutStartTime.sink.add(startTime);

  @override
  Stream<TimeOfDay?> get workoutEndTime =>
      _workoutEndTime.stream.transform(_validateEndTime);

  StreamTransformer<TimeOfDay?, TimeOfDay?> get _validateEndTime =>
      StreamTransformer.fromHandlers(
        handleData: (endTime, sink) {
          obj!.endTime = endTime;
          sink.add(endTime);
          if (!isWorkoutEndTimeCorrect(endTime)) {
            // TODO: add localization
            sink.addError('Обязательное поле');
          }
        },
      );

  @override
  void changeWorkoutEndTime(TimeOfDay? endTime) =>
      _workoutEndTime.sink.add(endTime);

  @override
  bool get isObjValid => _isValid.value ?? false;

  @override
  Stream<bool> get isObjValidStream => Rx.combineLatest6<String, Hall, Coach,
          DateTime?, TimeOfDay?, TimeOfDay?, bool>(
        workoutName,
        workoutHall,
        workoutCoach,
        workoutDate,
        workoutStartTime,
        workoutEndTime,
        (a, b, c, d, e, f) {
          final isValid = isWorkoutNameCorrect(a) &&
              isWorkoutHallCorrect(b) &&
              isWorkoutCoachCorrect(c) &&
              isWorkoutDateCorrect(d) &&
              isWorkoutStartTimeCorrect(e) &&
              isWorkoutEndTimeCorrect(f);
          _isValid.sink.add(isValid);
          return _isValid.value ?? false;
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

mixin WorkoutFormValidator {
  bool isWorkoutNameCorrect(String name) => name.length > 2;

  bool isWorkoutHallCorrect(Hall hall) => hall.isNotEmpty;

  bool isWorkoutCoachCorrect(Coach coach) => coach.isNotEmpty;

  // TODO: rework all methods down below
  bool isWorkoutDateCorrect(DateTime? date) => date != null;

  bool isWorkoutStartTimeCorrect(TimeOfDay? startTime) => startTime != null;

  bool isWorkoutEndTimeCorrect(TimeOfDay? endTime) => endTime != null;
}
