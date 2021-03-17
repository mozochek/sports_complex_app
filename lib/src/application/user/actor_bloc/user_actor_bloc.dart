import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/user/actor_bloc/i_user_actor_bloc.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/role.dart';
import 'package:sports_complex_app/src/infrastructure/user/i_user_repository.dart';

@LazySingleton(
  as: IUserActorBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class UserActorBloc extends IUserActorBloc {
  UserActorBloc(this._repository);

  final IUserRepository _repository;

  @override
  Future<void> banUser(User user) {
    // TODO: implement ban
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserRole(User user, Role newRole) async =>
      _repository.updateUserRole(user, newRole);
}
