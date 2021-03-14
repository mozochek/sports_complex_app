import 'package:sports_complex_app/src/application/core/i_watcher_by_date_bloc.dart';
import 'package:sports_complex_app/src/domain/core/repositories/watcher_by_date_mixin.dart';
import 'package:sports_complex_app/src/domain/workouts/workout.dart';

abstract class IWorkoutsWatcherBloc
    extends IWatcherByDateBloc<Workout> {
  IWorkoutsWatcherBloc(WatcherByDateMixin<Workout> repository)
      : super(repository);
}
