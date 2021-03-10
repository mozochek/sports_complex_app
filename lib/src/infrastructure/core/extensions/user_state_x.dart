import 'package:sports_complex_app/src/domain/user/user_state.dart';

extension UserStateX on UserState {
  String get description {
    switch (this) {
      case UserState.signedIn:
        return 'Пользователь успешно зарегестрировал аккаунт';
        break;
      case UserState.signedUp:
        return 'Пользователь успешно авторизовался';
        break;
      case UserState.signedOut:
        return 'Пользователь вышел из своего аккаунта';
        break;
      default:
        return '';
    }
  }
}
