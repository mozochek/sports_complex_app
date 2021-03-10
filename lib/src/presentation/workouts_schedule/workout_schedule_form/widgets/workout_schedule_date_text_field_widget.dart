import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/date_time_x.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';

class WorkoutScheduleDateTextField extends StatelessWidget {
  const WorkoutScheduleDateTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IWorkoutFormBloc>(context);

    return StreamBuilder<DateTime>(
      stream: bloc.workoutDate,
      builder: (_, snapshot) {
        return TextFormField(
          controller: TextEditingController(
            // TODO: add localization
            text: snapshot.hasData
                ? snapshot.data.asFormattedString
                : 'Выберите дату проведения',
          ),
          decoration: InputDecoration(
            labelText: 'Дата проведения',
            prefixIcon: const Icon(Icons.today),
            errorText: snapshot.error as String,
            errorMaxLines: 3,
          ),
          readOnly: true,
          onTap: () async {
            final today = DateTime.now();
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: today,
              firstDate: today,
              lastDate: DateTime(
                today.year,
                today.month,
                today.day + 14,
              ),
            );
            bloc.changeWorkoutDate(pickedDate);
          },
        );
      },
    );
  }
}