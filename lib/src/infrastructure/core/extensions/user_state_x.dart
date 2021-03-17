import 'package:sports_complex_app/src/domain/user/user_auth_state.dart';

extension UserStateX on UserAuthState {
  String get description {
    switch (this) {
      case UserAuthState.signedIn:
        return 'Пользователь успешно зарегестрировал аккаунт';
      case UserAuthState.signedUp:
        return 'Пользователь успешно авторизовался';
      case UserAuthState.signedOut:
        return 'Пользователь вышел из своего аккаунта';
      default:
        return '';
    }
  }
}
