import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';

import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/user_auth_state.dart';
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
    _listenUserAuthStates();
  }

  final _userController = BehaviorSubject<User?>();

  final StreamController<UserAuthState> _userAuthStateController =
      StreamController<UserAuthState>.broadcast();

  @override
  User? get currentUser => _userController.value;

  @override
  void addUserAuthState(UserAuthState state) =>
      _userAuthStateController.add(state);

  @override
  void addUser(User? user) => _userController.add(user);

  void _listenUserAuthStates() {
    _userAuthStateController.stream.listen(
      (userState) async {
        final router = getIt<ISportsComplexRouter>();
        switch (userState) {
          case UserAuthState.signedUp:
            await router.pushAndRemoveUntil(
              ScreenRoutes.signIn,
              predicate: (route) => route.settings.name == '/',
            );
            break;
          case UserAuthState.signedIn:
            await router.pushAndRemoveUntil(
              ScreenRoutes.bottomNav,
            );
            break;
          case UserAuthState.signedOut:
            await router.pushAndRemoveUntil(
              ScreenRoutes.welcome,
            );
            break;
        }
      },
    );
  }

  Future<void> dispose() async {
    await _userAuthStateController.close();
    await _userController.close();
  }
}
