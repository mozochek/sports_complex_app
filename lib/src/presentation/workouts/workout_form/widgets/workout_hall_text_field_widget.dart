import 'package:flutter/material.dart';

import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/presentation/common/hall_selector_dialog.dart';

class WorkoutHallTextField extends StatelessWidget {
  const WorkoutHallTextField({
    required this.formBloc,
    Key? key,
  }) : super(key: key);

  final IWorkoutFormBloc formBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Hall>(
      stream: formBloc.workoutHall,
      builder: (_, snapshot) {
        return TextFormField(
          controller: TextEditingController(
            // TODO: add localization
            text: snapshot.hasData ? snapshot.data!.name : 'Выберите зал',
          ),
          decoration: InputDecoration(
            labelText: 'Зал',
            prefixIcon: const Icon(Icons.sports_volleyball),
            errorText: snapshot.error as String?,
            errorMaxLines: 3,
          ),
          readOnly: true,
          onTap: () async {
            final pickedHall = await showDialog<Hall>(
              context: context,
              builder: (_) => const HallSelectorDialog(),
            );
            formBloc.changeWorkoutHall(pickedHall);
          },
        );
      },
    );
  }
}
