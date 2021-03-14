import 'package:firebase_auth/firebase_auth.dart';

import 'package:sports_complex_app/src/domain/core/exceptions/sign_up_exception.dart';
import 'package:sports_complex_app/src/infrastructure/core/exceptions/user_repository_exception.dart';

/// Enum which represents all possible exceptions while creating a new user.
///
/// Used with [SignUpException] to define exception response behaviour.
///
/// Include [FirebaseAuthException] codes support which can be thrown
/// after calling [FirebaseAuth.instance.createUserWithEmailAndPassword()].
enum SignUpExceptionCode {
  /// Equivalent to [FirebaseAuthException] with code 'email-already-in-use'
  firebaseEmailAlreadyInUse,

  /// Equivalent to [FirebaseAuthException] with code 'operation-not-allowed'
  firebaseOperationNotAllowed,

  /// Equivalent to [FirebaseAuthException] with code 'weak-password'
  firebaseWeakPassword,

  /// Equivalent to [FirebaseAuthException] with code 'unknown'
  firebaseUnknownCode,

  /// Equivalent to [UserRepositoryException] with code [UserRepositoryException.invalidUserSurname]
  invalidUserSurname,

  /// Equivalent to [UserRepositoryException] with code [UserRepositoryException.invalidUserName]
  invalidUserName,

  /// Equivalent to [FirebaseAuthException] with code 'invalid-email'
  /// or to [UserRepositoryException] with code [UserRepositoryException.invalidEmail]
  invalidEmail,

  /// Option for unexpected exception code
  unsupportedCode,
}

// TODO: add localization
extension SignUpExceptionCodeX on SignUpExceptionCode {
  String get description {
    switch (this) {
      case SignUpExceptionCode.firebaseEmailAlreadyInUse:
        return 'Данный адрес эл.почты уже зарегестрирован';
      case SignUpExceptionCode.firebaseOperationNotAllowed:
        return 'Данный вид регистрации временно недоступен. Попробуйте позже';
      case SignUpExceptionCode.firebaseWeakPassword:
        return 'Введен слабый пароль';
      case SignUpExceptionCode.firebaseUnknownCode:
        return 'Введены некорректные данные';
      case SignUpExceptionCode.invalidUserSurname:
        return 'Фамилия должна состоять из 2 и более символов';
      case SignUpExceptionCode.invalidUserName:
        return 'Имя должно состоять из 2 и более символов';
      case SignUpExceptionCode.invalidEmail:
        return 'Введен некорректный адрес эл.почты';
      case SignUpExceptionCode.unsupportedCode:
        return 'Произошла неподдерживаемя ошибка';
      default:
        return 'Произошла неизвестная ошибка';
    }
  }
}
