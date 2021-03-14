import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/workout_form_bloc.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/workout_form.dart';

class WorkoutsFab extends StatelessWidget {
  const WorkoutsFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // TODO: old navigation
        await Navigator.of(context).push<void>(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Provider<IWorkoutFormBloc>(
              create: (_) => WorkoutFormBloc.forCreating(),
              dispose: (_, bloc) async => bloc.dispose(),
              child: const WorkoutForm(),
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}