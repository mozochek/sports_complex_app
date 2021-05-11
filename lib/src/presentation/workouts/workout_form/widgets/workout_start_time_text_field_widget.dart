import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/time_of_day_x.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';

class WorkoutStartTimeTextField extends StatelessWidget {
  const WorkoutStartTimeTextField({
    required this.formBloc,
    Key? key,
  }) : super(key: key);

  final IWorkoutFormBloc formBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TimeOfDay?>(
      stream: formBloc.workoutStartTime,
      builder: (_, snapshot) {
        return TextFormField(
          controller: TextEditingController(
            // TODO: add localization
            text: snapshot.hasData
                ? snapshot.data!.asFormattedString
                : 'Выберите время начала тренеровки',
          ),
          decoration: InputDecoration(
            labelText: 'Время начала',
            prefixIcon: const Icon(Icons.watch_later_outlined),
            errorText: snapshot.error as String?,
            errorMaxLines: 3,
          ),
          readOnly: true,
          onTap: () async {
            final pickedStartTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            formBloc.changeWorkoutStartTime(pickedStartTime);
          },
        );
      },
    );
  }
}
