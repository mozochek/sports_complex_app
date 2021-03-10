import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';

class WorkoutScheduleNameTextField extends StatelessWidget {
  const WorkoutScheduleNameTextField({
    Key key,
    this.initialValue,
  }) : super(key: key);

  final String initialValue;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IWorkoutFormBloc>(context);

    return StreamBuilder<String>(
      stream: bloc.workoutName,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: initialValue,
          keyboardType: TextInputType.name,
          onChanged: bloc.changeWorkoutName,
          decoration: InputDecoration(
            // TODO: add localization
            labelText: 'Название',
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String,
            errorMaxLines: 3,
          ),
        );
      },
    );
  }
}