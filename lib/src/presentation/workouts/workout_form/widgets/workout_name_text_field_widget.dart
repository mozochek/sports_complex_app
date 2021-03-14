import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';

class WorkoutNameTextField extends StatelessWidget {
  const WorkoutNameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IWorkoutFormBloc>(context);

    return StreamBuilder<String>(
      stream: bloc.workoutName,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: bloc.obj?.name,
          keyboardType: TextInputType.name,
          onChanged: bloc.changeWorkoutName,
          decoration: InputDecoration(
            // TODO: add localization
            labelText: 'Название',
            prefixIcon: const Icon(Icons.short_text),
            errorText: snapshot.error as String?,
            errorMaxLines: 3,
          ),
        );
      },
    );
  }
}