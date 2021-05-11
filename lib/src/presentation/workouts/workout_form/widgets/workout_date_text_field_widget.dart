import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/date_time_x.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';

class WorkoutDateTextField extends StatelessWidget {
  const WorkoutDateTextField({
    required this.formBloc,
    Key? key,
  }) : super(key: key);

  final IWorkoutFormBloc formBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime?>(
      stream: formBloc.workoutDate,
      builder: (_, snapshot) {
        return TextFormField(
          controller: TextEditingController(
            // TODO: add localization
            text: snapshot.hasData
                ? snapshot.data!.asFormattedString
                : 'Выберите дату проведения',
          ),
          decoration: InputDecoration(
            labelText: 'Дата проведения',
            prefixIcon: const Icon(Icons.today),
            errorText: snapshot.error as String?,
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
            formBloc.changeWorkoutDate(pickedDate);
          },
        );
      },
    );
  }
}
