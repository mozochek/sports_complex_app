import 'package:sports_complex_app/src/application/core/i_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/coaches/coach.dart';
import 'package:sports_complex_app/src/domain/core/repositories/watcher_mixin.dart';

abstract class ICoachesWatcherBloc extends IWatcherBloc<Coach> {
  ICoachesWatcherBloc(WatcherMixin<Coach> repository) : super(repository);
}
