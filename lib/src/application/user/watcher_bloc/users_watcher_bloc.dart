import 'package:injectable/injectable.dart';
import 'package:sports_complex_app/src/application/user/watcher_bloc/i_users_watcher_bloc.dart';
import 'package:sports_complex_app/src/infrastructure/user/i_user_repository.dart';

@LazySingleton(
  as: IUsersWatcherBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class UsersWatcherBloc extends IUsersWatcherBloc {
  UsersWatcherBloc(IUserRepository repository) : super(repository);
}
