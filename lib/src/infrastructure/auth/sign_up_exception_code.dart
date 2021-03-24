import 'package:firebase_auth/firebase_auth.dart';

import 'package:sports_complex_app/generated/l10n.dart';
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

extension SignUpExceptionCodeX on SignUpExceptionCode {
  String get description {
    switch (this) {
      case SignUpExceptionCode.firebaseEmailAlreadyInUse:
        return S.current.email_already_in_use;
      case SignUpExceptionCode.firebaseOperationNotAllowed:
        return S.current.operation_not_allowed;
      case SignUpExceptionCode.firebaseWeakPassword:
        return S.current.weak_password;
      case SignUpExceptionCode.firebaseUnknownCode:
        return S.current.incorrect_data;
      case SignUpExceptionCode.invalidUserSurname:
        return S.current.invalid_user_surname;
      case SignUpExceptionCode.invalidUserName:
        return S.current.invalid_user_name;
      case SignUpExceptionCode.invalidEmail:
        return S.current.invalid_email;
      case SignUpExceptionCode.unsupportedCode:
        return S.current.unsupported_error;
      default:
        return S.current.unknown_error;
    }
  }
}
