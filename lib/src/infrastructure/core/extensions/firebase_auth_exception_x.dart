import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_complex_app/src/infrastructure/auth/sign_in_exception_code.dart';

import 'package:sports_complex_app/src/infrastructure/auth/sign_up_exception_code.dart';

extension FirebaseAuthExceptionX on FirebaseAuthException {
  /// Returns [SignUpExceptionCode] enum value
  /// depending on the FirebaseAuthException.code value
  SignUpExceptionCode get asSignUpEnumCode {
    switch (code) {
      case 'email-already-in-use':
        return SignUpExceptionCode.firebaseEmailAlreadyInUse;
      case 'invalid-email':
        return SignUpExceptionCode.invalidEmail;
      case 'operation-not-allowed':
        return SignUpExceptionCode.firebaseOperationNotAllowed;
      case 'weak-password':
        return SignUpExceptionCode.firebaseWeakPassword;
      case 'unknown':
        return SignUpExceptionCode.firebaseUnknownCode;
      default:
        return SignUpExceptionCode.unsupportedCode;
    }
  }

  /// Returns [SignInExceptionCode] enum value
  /// depending on the FirebaseAuthException.code value
  SignInExceptionCode get asSignInEnumCode {
    switch (code) {
      case 'invalid-email':
        return SignInExceptionCode.firebaseInvalidEmail;
      case 'wrong-password':
        return SignInExceptionCode.firebaseWrongPassword;
      case 'user-disabled':
        return SignInExceptionCode.firebaseUserDisabled;
      case 'user-not-found':
        return SignInExceptionCode.firebaseUserNotFound;
      case 'too-many-requests':
        return SignInExceptionCode.firebaseTooManyRequests;
      case 'unknown':
        return SignInExceptionCode.networkProblems;
      default:
        return SignInExceptionCode.unsupportedCode;
    }
  }
}
