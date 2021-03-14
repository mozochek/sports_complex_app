import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/presentation/common/coach_selector_dialog.dart';
import 'package:sports_complex_app/injection.dart';


class WorkoutCoachTextField extends StatelessWidget {
  const WorkoutCoachTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<IWorkoutFormBloc>(context);

    return StreamBuilder<Coach>(
      stream: bloc.workoutCoach,
      builder: (_, snapshot) {
        return TextFormField(
          controller: TextEditingController(
            // TODO: add localization
            text: snapshot.hasData
                ? snapshot.data!.fullName
                : 'Выберите тренера',
          ),
          decoration: InputDecoration(
            labelText: 'Тренер',
            prefixIcon: const Icon(Icons.account_circle),
            errorText: snapshot.error as String?,
            errorMaxLines: 3,
          ),
          readOnly: true,
          onTap: () async {
            final pickedCoach = await showDialog<Coach>(
              context: context,
              builder: (_) => Provider(
                create: (_) => getIt<ICoachesWatcherBloc>(),
                child: const CoachSelectorDialog(),
              ),
            );
            bloc.changeWorkoutCoach(pickedCoach);
          },
        );
      },
    );
  }
}