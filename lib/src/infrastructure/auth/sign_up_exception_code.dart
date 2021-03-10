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

  // TODO: add doc
  ///
  invalidUserSurname,

  // TODO: add doc
  ///
  invalidUserName,

  // TODO: add doc
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
        break;
      case SignUpExceptionCode.firebaseOperationNotAllowed:
        return 'Данный вид регистрации временно недоступен. Попробуйте позже';
        break;
      case SignUpExceptionCode.firebaseWeakPassword:
        return 'Введен слабый пароль';
        break;
      case SignUpExceptionCode.firebaseUnknownCode:
        return 'Введены некорректные данные';
        break;
      case SignUpExceptionCode.invalidUserSurname:
        return 'Фамилия должна состоять из 2 и более символов';
        break;
      case SignUpExceptionCode.invalidUserName:
        return 'Имя должно состоять из 2 и более символов';
        break;
      case SignUpExceptionCode.invalidEmail:
        return 'Введен некорректный адрес эл.почты';
        break;
      case SignUpExceptionCode.unsupportedCode:
        return 'Произошла неподдерживаемя ошибка';
        break;
      default:
        return 'Произошла неизвестная ошибка';
        break;
    }
  }
}
