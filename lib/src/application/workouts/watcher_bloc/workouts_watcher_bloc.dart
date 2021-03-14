import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/workouts/watcher_bloc/i_workouts_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/workouts/i_workouts_firestore_crud_repository.dart';

@LazySingleton(
  as: IWorkoutsWatcherBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class WorkoutsWatcherBloc extends IWorkoutsWatcherBloc {
  WorkoutsWatcherBloc(IWorkoutsFirestoreCrudRepository repository)
      : super(repository);
}
