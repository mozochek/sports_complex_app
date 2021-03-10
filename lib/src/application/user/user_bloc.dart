import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/user_state.dart';

@LazySingleton(
  env: [
    Environment.dev,
    Environment.prod,
    Environment.test,
  ],
)
class UserBloc {
  final _userController = BehaviorSubject<User>();

  final StreamController<UserState> _userStateController =
      StreamController<UserState>.broadcast();

  User get currentUser => _userController.value;

  Stream<User> get userChanges => _userController.stream;

  Stream<UserState> get userStateChanges => _userStateController.stream;

  void addUserState(UserState state) => _userStateController.add(state);

  void addUser(User user) => _userController.add(user);

  Future<void> dispose() async {
    await _userStateController.close();
    await _userController.close();
  }
}
