import 'package:sports_complex_app/src/application/core/i_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/core/repositories/watcher_mixin.dart';
import 'package:sports_complex_app/src/domain/halls/hall.dart';

abstract class IHallsWatcherBloc extends IWatcherBloc<Hall> {
  IHallsWatcherBloc(WatcherMixin<Hall> repository) : super(repository);
}
