import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_complex_app/src/application/halls/watcher_bloc/i_halls_watcher_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';
import 'package:sports_complex_app/src/presentation/common/hall_selector_dialog.dart';
import 'package:sports_complex_app/injection.dart';


class WorkoutScheduleHallTextField extends StatelessWidget {
  const WorkoutScheduleHallTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IWorkoutFormBloc>(context);

    return StreamBuilder<Hall>(
      stream: bloc.workoutHall,
      builder: (_, snapshot) {
        return TextFormField(
          controller: TextEditingController(
            // TODO: add localization
            text: snapshot.hasData
                ? snapshot.data.name
                : 'Выберите зал',
          ),
          decoration: InputDecoration(
            labelText: 'Зал',
            prefixIcon: const Icon(Icons.sports_volleyball),
            errorText: snapshot.error as String,
            errorMaxLines: 3,
          ),
          readOnly: true,
          onTap: () async {
            final pickedHall = await showDialog<Hall>(
              context: context,
              builder: (_) => Provider(
                create: (_) => getIt<IHallsWatcherBloc>(),
                child: const HallSelectorDialog(),
              ),
            );
            bloc.changeWorkoutHall(pickedHall);
          },
        );
      },
    );
  }
}