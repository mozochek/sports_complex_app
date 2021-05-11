import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/user_auth_state.dart';
import 'package:sports_complex_app/src/infrastructure/user/i_user_repository.dart';

@LazySingleton(
  as: IUserBloc,
  env: [
    Environment.dev,
    Environment.prod,
    Environment.test,
  ],
)
class UserBloc extends IUserBloc {
  UserBloc(this._repository);

  final IUserRepository _repository;

  final _currentUserController = BehaviorSubject<User?>();

  final StreamController<UserAuthState> _userAuthStateController =
      StreamController<UserAuthState>.broadcast();

  @override
  User? get currentUser => _currentUserController.value;

  @override
  Stream<User?> get currentUserStream => _repository.watchUser(currentUser!);

  @override
  void addUserAuthState(UserAuthState state) =>
      _userAuthStateController.add(state);

  @override
  void addUser(User? user) {
    _currentUserController.add(user);
  }

  Future<void> dispose() async {
    await _userAuthStateController.close();
    await _currentUserController.close();
  }
}
