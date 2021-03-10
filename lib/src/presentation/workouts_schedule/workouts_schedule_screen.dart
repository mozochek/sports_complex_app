import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sports_complex_app/src/application/workouts_schedule/actor_bloc/i_workout_schedule_actor_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/date_bloc/workouts_schedule_date_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/i_workout_schedule_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/form_bloc/workout_schedule_form_bloc.dart';
import 'package:sports_complex_app/src/application/workouts_schedule/watcher_bloc/i_workouts_schedule_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/presentation/common/delete_dialog.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/no_schedule_indicator.dart';
import 'package:sports_complex_app/src/presentation/common/scaffold_wrapper.dart';
import 'package:sports_complex_app/src/presentation/common/workout_schedule_list_tile_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/widgets/workouts_schedule_fab_widget.dart';
import 'package:sports_complex_app/src/presentation/workouts_schedule/workout_schedule_form/workout_schedule_form.dart';

// TODO: refactor
class WorkoutsScheduleScreen extends StatelessWidget {
  const WorkoutsScheduleScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watcherBloc = Provider.of<IWorkoutsScheduleWatcherBloc>(context);
    final dateBloc = Provider.of<WorkoutsScheduleDateBloc>(context);

    return ScaffoldWrapper(
      body: StreamBuilder<DateTime>(
        stream: dateBloc.selectedDate,
        builder: (_, snapshot) {
          return Column(
            children: [
              DatePicker(
                DateTime.now(),
                daysCount: 14,
                initialSelectedDate: snapshot.data ?? DateTime.now(),
                onDateChange: dateBloc.changeSelectedDate,
                locale: 'ru_RU',
              ),
              StreamBuilder<List<Workout>>(
                stream: watcherBloc
                    .streamOfObjectsByDate(snapshot.data ?? DateTime.now()),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      return snapshot.data.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (_, index) {
                                final workout = snapshot.data[index];
                                return WorkoutScheduleListTile(
                                  workout: workout,
                                  onTap: () async {
                                    await Navigator.of(context).push<void>(
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (_) =>
                                            Provider<IWorkoutFormBloc>(
                                          create: (_) => WorkoutScheduleFormBloc
                                              .forEditing(workout),
                                          dispose: (_, bloc) async =>
                                              bloc.dispose(),
                                          child: WorkoutScheduleForm(
                                            editedWorkoutSchedule: workout,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  onLongPress: () async {
                                    final isDeleteConfirmed =
                                        await showDialog<bool>(
                                      context: context,
                                      builder: (_) {
                                        // TODO: add localization
                                        return const DeleteDialog(
                                          title:
                                              'Удалить расписание тренировки?',
                                          content:
                                              'Выбранное расписание тренировки будет удалено из общего расписания',
                                        );
                                      },
                                    );

                                    // Null check in this statement work when user tap outside of dialog.
                                    // In this case we didn't get any response from dialog so as default
                                    // we set it to false
                                    if (isDeleteConfirmed ?? false) {
                                      await Provider.of<
                                          IWorkoutScheduleActorBloc>(
                                        context,
                                        listen: false,
                                      ).delete(workout);
                                    }
                                  },
                                );
                              },
                            )
                          : const Expanded(
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
      floatingActionButton: const WorkoutsScheduleFab(),
    );
  }
}
