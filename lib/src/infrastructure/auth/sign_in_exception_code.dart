import 'package:firebase_auth/firebase_auth.dart';

import 'package:sports_complex_app/generated/l10n.dart';
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

  /// Equivalent to [FirebaseAuthException] with code 'unknown'
  /// Mostly when internet connection troubles occurs
  networkProblems,

  /// Option for unexpected exception code
  unsupportedCode,
}

extension SignInExceptionCodeX on SignInExceptionCode {
  String get description {
    switch (this) {
      case SignInExceptionCode.firebaseInvalidEmail:
        return S.current.invalid_email_or_password;
      case SignInExceptionCode.firebaseWrongPassword:
        return S.current.invalid_email_or_password;
      case SignInExceptionCode.firebaseUserDisabled:
        return S.current.user_disabled;
      case SignInExceptionCode.firebaseUserNotFound:
        return S.current.user_not_found;
      case SignInExceptionCode.firebaseTooManyRequests:
        return S.current.too_many_requests;
      case SignInExceptionCode.userDataIsEmpty:
        return S.current.user_data_is_empty;
      case SignInExceptionCode.networkProblems:
        return S.current.network_problems;
      case SignInExceptionCode.unsupportedCode:
        return S.current.unsupported_error;
      default:
        return S.current.unknown_error;
    }
  }
}
