import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';

class WorkoutFormInhWidget extends InheritedWidget {
  const WorkoutFormInhWidget({
    required this.workoutFormBloc,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final IWorkoutFormBloc workoutFormBloc;

  @override
  bool updateShouldNotify(WorkoutFormInhWidget oldWidget) {
    return oldWidget != this;
  }

  static WorkoutFormInhWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WorkoutFormInhWidget>();
  }

  Future<void> dispose() async {
    await workoutFormBloc.dispose();
  }
}
