import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/workouts_schedule/watcher_bloc/i_workouts_schedule_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart';

@LazySingleton(
  as: IWorkoutsScheduleWatcherBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class WorkoutsScheduleWatcherBloc extends IWorkoutsScheduleWatcherBloc {
  WorkoutsScheduleWatcherBloc(IWorkoutsFirestoreCrudRepository repository)
      : super(repository);
}
