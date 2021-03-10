import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/workout_schedule_form_bloc.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/workout_schedule_form/workout_schedule_form.dart';

class WorkoutsScheduleFab extends StatelessWidget {
  const WorkoutsScheduleFab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Provider<IWorkoutFormBloc>(
              create: (_) => WorkoutScheduleFormBloc.forCreating(),
              dispose: (_, bloc) async => bloc.dispose(),
              child: const WorkoutScheduleForm(),
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}