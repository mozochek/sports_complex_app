import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/coaches/watcher_bloc/i_coaches_watcher_bloc.dart';
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/presentation/common/coach_selector_dialog.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';

class WorkoutCoachTextField extends StatelessWidget {
  const WorkoutCoachTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formBloc = Provider.of<IWorkoutFormBloc>(context);
    final userBloc = getIt<IUserBloc>();
    // final currentUser = getIt<IUserBloc>().currentUser!;

    // if (currentUser.isCoach) {
    //   bloc.changeWorkoutCoach(Coach.fromUser(currentUser));
    // }

    return StreamBuilder<Coach>(
      stream: formBloc.workoutCoach,
      builder: (_, coachSnapshot) {
        return StreamBuilder<User?>(
          stream: userBloc.currentUserStream,
          builder: (_, userSnapshot) {
            if (userSnapshot.hasData) {
              final currentUser = userSnapshot.data!;

              if (currentUser.isCoach) {
                formBloc.changeWorkoutCoach(Coach.fromUser(currentUser));
              }

              return TextFormField(
                controller: TextEditingController(
                  // TODO: add localization
                  text: coachSnapshot.hasData
                      ? coachSnapshot.data!.fullName
                      : 'Выберите тренера',
                ),
                decoration: InputDecoration(
                  labelText: 'Тренер',
                  prefixIcon: const Icon(Icons.account_circle),
                  errorText: coachSnapshot.error as String?,
                  errorMaxLines: 3,
                ),
                readOnly: true,
                onTap: currentUser.isCoach
                    ? null
                    : () async {
                        final pickedCoach = await showDialog<Coach>(
                          context: context,
                          builder: (_) => Provider(
                            create: (_) => getIt<ICoachesWatcherBloc>(),
                            child: const CoachSelectorDialog(),
                          ),
                        );
                        formBloc.changeWorkoutCoach(pickedCoach);
                      },
              );
            }
            return const LoadingIndicator();
          },
        );
      },
    );
  }
}
