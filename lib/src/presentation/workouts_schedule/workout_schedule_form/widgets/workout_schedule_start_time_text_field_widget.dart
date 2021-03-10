import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/time_of_day_x.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';

class WorkoutScheduleStartTimeTextField extends StatelessWidget {
  const WorkoutScheduleStartTimeTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IWorkoutFormBloc>(context);

    return StreamBuilder<TimeOfDay>(
      stream: bloc.workoutStartTime,
      builder: (_, snapshot) {
        return TextFormField(
          controller: TextEditingController(
            // TODO: add localization
            text: snapshot.hasData
                ? snapshot.data.asFormattedString
                : 'Выберите время начала тренеровки',
          ),
          decoration: InputDecoration(
            labelText: 'Время начала',
            prefixIcon: const Icon(Icons.watch_later_outlined),
            errorText: snapshot.error as String,
            errorMaxLines: 3,
          ),
          readOnly: true,
          onTap: () async {
            final pickedStartTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            bloc.changeWorkoutStartTime(pickedStartTime);
          },
        );
      },
    );
  }
}