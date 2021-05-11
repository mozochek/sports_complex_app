import 'package:flutter/material.dart';

import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/date_bloc/workouts_schedule_date_bloc.dart';
import 'package:sports_complex_app/src/application/workouts/watcher_bloc/i_workouts_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';
import 'package:sports_complex_app/src/presentation/common/loading_indicator_widget.dart';
import 'package:sports_complex_app/src/presentation/common/no_schedule_indicator.dart';
import 'package:sports_complex_app/src/presentation/workouts/widgets/animated_fab_wrapper.dart';
import 'package:sports_complex_app/src/presentation/workouts/widgets/list_of_workouts.dart';
import 'package:sports_complex_app/src/presentation/workouts/widgets/workouts_date_picker_line.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watcherBloc = getIt<IWorkoutsWatcherBloc>();
    final dateBloc = getIt<WorkoutsScheduleDateBloc>();
    // TODO: !
    final userBloc = getIt<IUserBloc>();

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<DateTime>(
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
                      // TODO: !
                      final workouts = snapshot.data!;

                      return workouts.isNotEmpty
                          ? ListOfWorkouts(workouts: workouts)
                          : const Expanded(
                              child: NoScheduleIndicator(),
                            );
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
      ),
      floatingActionButton: StreamBuilder<User?>(
        stream: userBloc.currentUserStream,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final currentUser = snapshot.data!;
            if (currentUser.isCoachOrHigher) {
              return const AnimatedFabWrapper();
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
