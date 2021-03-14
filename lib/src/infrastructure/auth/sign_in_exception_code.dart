import 'package:firebase_auth/firebase_auth.dart';

import 'package:sports_complex_app/src/domain/core/exceptions/sign_in_exception.dart';
import 'package:sports_complex_app/src/infrastructure/core/exceptions/user_repository_exception.dart';

/// Enum which represents all possible exceptions while authenticated a user.
///
/// Used with [SignInException] to define exception response behaviour.
///
/// Include [FirebaseAuthException] codes support which can be thrown
/// after calling [FirebaseAuth.instance.signInWithEmailAndPassword()].
enum SignInExceptionCode {
  /// Equivalent to [FirebaseAuthException] with code 'invalid-email'
  firebaseInvalidEmail,

  /// Equivalent to [FirebaseAuthException] with code 'wrong-password'
  firebaseWrongPassword,

  /// Equivalent to [FirebaseAuthException] with code 'user-disabled'
  firebaseUserDisabled,

  /// Equivalent to [FirebaseAuthException] with code 'user-not-found'
  firebaseUserNotFound,

  /// Equivalent to [FirebaseAuthException] with code 'too-many-requests'
  firebaseTooManyRequests,

  /// Equivalent to [UserRepositoryException] with code [UserRepositoryException.userDataIsEmpty]
  userDataIsEmpty,

  /// Option for unexpected exception code
  unsupportedCode,
}

// TODO: add localization
extension SignInExceptionCodeX on SignInExceptionCode {
  String get description {
    switch (this) {
      case SignInExceptionCode.firebaseInvalidEmail:
        return 'Данный пользователь не найден';
      case SignInExceptionCode.firebaseWrongPassword:
        return 'Данный пользователь не найден';
      case SignInExceptionCode.firebaseUserDisabled:
        return 'Данный пользователь заблокирован';
      case SignInExceptionCode.firebaseUserNotFound:
        return 'Данного пользователя не существует';
      case SignInExceptionCode.firebaseTooManyRequests:
        return 'Слишком много попыток. Попробуйте позже';
      case SignInExceptionCode.userDataIsEmpty:
        return 'Не удалось получить данные пользователя';
      case SignInExceptionCode.unsupportedCode:
        return 'Неподдерживаемая ошибка';
      default:
        return 'Неизвестная ошибка';
    }
  }
}
