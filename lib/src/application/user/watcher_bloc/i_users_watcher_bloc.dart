import 'package:sports_complex_app/src/application/core/i_watcher_bloc.dart';
import 'package:sports_complex_app/src/domain/core/repositories/watcher_mixin.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';

abstract class IUsersWatcherBloc extends IWatcherBloc<User> {
  IUsersWatcherBloc(WatcherMixin<User> repository) : super(repository);
}
