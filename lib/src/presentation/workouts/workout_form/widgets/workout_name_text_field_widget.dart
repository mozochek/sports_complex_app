import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';

class WorkoutNameTextField extends StatelessWidget {
  const WorkoutNameTextField({
    required this.formBloc,
    Key? key,
  }) : super(key: key);

  final IWorkoutFormBloc formBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: formBloc.workoutName,
      builder: (_, snapshot) {
        return TextFormField(
          initialValue: formBloc.obj?.name,
          keyboardType: TextInputType.name,
          onChanged: formBloc.changeWorkoutName,
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