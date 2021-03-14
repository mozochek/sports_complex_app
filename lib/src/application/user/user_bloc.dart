import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';

import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/user_state.dart';
import 'package:sports_complex_app/src/presentation/router/i_sports_complex_router.dart';

@LazySingleton(
  as: IUserBloc,
  env: [
    Environment.dev,
    Environment.prod,
    Environment.test,
  ],
)
class UserBloc implements IUserBloc {
  UserBloc() {
    _listenUserStates();
  }

  final _userController = BehaviorSubject<User?>();

  final StreamController<UserState> _userStateController =
      StreamController<UserState>.broadcast();

  @override
  User? get currentUser => _userController.value;

  @override
  void addUserState(UserState state) => _userStateController.add(state);

  @override
  void addUser(User? user) => _userController.add(user);

  void _listenUserStates() {
    _userStateController.stream.listen(
      (userState) async {
        final router = getIt<ISportsComplexRouter>();
        switch (userState) {
          case UserState.signedUp:
            await router.pushAndRemoveUntil(
              ScreenRoutes.signIn,
              predicate: (route) => route.settings.name == '/',
            );
            break;
          case UserState.signedIn:
            await router.pushAndRemoveUntil(
              ScreenRoutes.bottomNav,
            );
            break;
          case UserState.signedOut:
            await router.pushAndRemoveUntil(
              ScreenRoutes.welcome,
            );
            break;
        }
      },
    );
  }

  @override
  Future<void> dispose() async {
    await _userStateController.close();
    await _userController.close();
  }
}
