import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/actor_bloc/i_workout_actor_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/workout_form_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/presentation/common/delete_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/workout_list_tile_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/workout_form.dart';

class ListOfWorkouts extends StatelessWidget {
  const ListOfWorkouts({
    required this.workouts,
    Key? key,
  }) : super(key: key);

  final List<Workout> workouts;

  @override
  Widget build(BuildContext context) {
    // TODO: !
    final user = getIt<IUserBloc>().currentUser!;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: workouts.length,
      itemBuilder: (_, index) {
        final workout = workouts[index];
        return WorkoutListTile(
          workout: workout,
          onTap: user.isAdmin
              ? () async {
                  // TODO: old navigation
                  await Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) => Provider<IWorkoutFormBloc>(
                        create: (_) => WorkoutFormBloc.forEditing(
                          workout,
                        ),
                        dispose: (_, bloc) async => bloc.dispose(),
                        child: const WorkoutForm(),
                      ),
                    ),
                  );
                }
              : null,
          onLongPress: user.isAdmin
              ? () async {
                  final isDeleteConfirmed = await showDialog<bool>(
                    context: context,
                    builder: (_) {
                      // TODO: add localization
                      return const DeleteDialog(
                        title: 'Удалить расписание тренировки?',
                        content:
                            'Выбранное расписание тренировки будет удалено из общего расписания',
                      );
                    },
                  );

                  // Null check in this statement work when user tap outside of dialog.
                  // In this case we didn't get any response from dialog so as default
                  // we set it to false
                  if (isDeleteConfirmed ?? false) {
                    await Provider.of<IWorkoutActorBloc>(
                      context,
                      listen: false,
                    ).delete(workout);
                  }
                }
              : null,
        );
      },
    );
  }
}
