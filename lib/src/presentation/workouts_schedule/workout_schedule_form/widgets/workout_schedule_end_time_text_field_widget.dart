import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/time_of_day_x.dart';

class WorkoutScheduleEndTimeTextField extends StatelessWidget {
  const WorkoutScheduleEndTimeTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IWorkoutFormBloc>(context);

    return StreamBuilder<TimeOfDay>(
      stream: bloc.workoutEndTime,
      builder: (_, snapshot) {
        return TextFormField(
          controller: TextEditingController(
            text: snapshot.hasData
                ? snapshot.data.asFormattedString
                : 'Выберите время окончания тренеровки',
          ),
          decoration: InputDecoration(
            labelText: 'Время окончания',
            prefixIcon: const Icon(Icons.watch_later_outlined),
            errorText: snapshot.error as String,
            errorMaxLines: 3,
          ),
          readOnly: true,
          onTap: () async {
            final pickedEndTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            bloc.changeWorkoutEndTime(pickedEndTime);
          },
        );
      },
    );
  }
}