import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/workouts/actor_bloc/i_workout_actor_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/date_bloc/workouts_schedule_date_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/i_workout_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/form_bloc/workout_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/watcher_bloc/i_workouts_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/presentation/common/delete_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/no_schedule_indicator.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/common/workout_schedule_list_tile_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/widgets/workouts_date_picker_line.dart';
import 'package:sports_complex_app/src/presentation/workouts/widgets/workouts_fab_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts/workout_form/workout_form.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watcherBloc = Provider.of<IWorkoutsWatcherBloc>(context);
    final dateBloc = Provider.of<WorkoutsScheduleDateBloc>(context);

    return ScaffoldWrapper(
      body: StreamBuilder<DateTime>(
        stream: dateBloc.selectedDate,
        builder: (_, snapshot) {
          return Column(
            children: [
              WorkoutsDatePickerLine(
                initialSelectedDate: snapshot.data,
                onDateChange: dateBloc.changeSelectedDate,
              ),
              StreamBuilder<List<Workout>>(
                stream: watcherBloc.streamOfObjectsByDate(
                  snapshot.data ?? DateTime.now(),
                ),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.done) {
                    final listOfWorkouts = snapshot.data!;
                    if (listOfWorkouts.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          final workout = snapshot.data![index];
                          return WorkoutScheduleListTile(
                            workout: workout,
                            onTap: () async {
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
                            },
                            onLongPress: () async {
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
                            },
                          );
                        },
                      );
                    } else {
                      return const Expanded(
                        child: NoScheduleIndicator(),
                      );
                    }
                  }
                  return const Expanded(
                    child: LoadingIndicator(),
                  );
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: const WorkoutsFab(),
    );
  }
}
