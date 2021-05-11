import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/time_of_day_x.dart';

class WorkoutEndTimeTextField extends StatelessWidget {
  const WorkoutEndTimeTextField({
    required this.formBloc,
    Key? key,
  }) : super(key: key);

  final IWorkoutFormBloc formBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TimeOfDay?>(
      stream: formBloc.workoutEndTime,
      builder: (_, snapshot) {
        return TextFormField(
          controller: TextEditingController(
            text: snapshot.hasData
                ? snapshot.data!.asFormattedString
                : 'Выберите время окончания тренеровки',
          ),
          decoration: InputDecoration(
            labelText: 'Время окончания',
            prefixIcon: const Icon(Icons.watch_later_outlined),
            errorText: snapshot.error as String?,
            errorMaxLines: 3,
          ),
          readOnly: true,
          onTap: () async {
            final pickedEndTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            formBloc.changeWorkoutEndTime(pickedEndTime);
          },
        );
      },
    );
  }
}
