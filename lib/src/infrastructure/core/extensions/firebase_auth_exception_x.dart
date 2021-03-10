import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_complex_app/src/infrastructure/auth/sign_in_exception_code.dart';

import 'package:sports_complex_app/src/infrastructure/auth/sign_up_exception_code.dart';

extension FirebaseAuthExceptionX on FirebaseAuthException {
  /// Return [SignUpExceptionCode] enum value
  /// depending on the [FirebaseAuthException.code] value
  SignUpExceptionCode get asSignUpEnumCode {
    switch (code) {
      case 'email-already-in-use':
        return SignUpExceptionCode.firebaseEmailAlreadyInUse;
        break;
      case 'invalid-email':
        return SignUpExceptionCode.invalidEmail;
        break;
      case 'operation-not-allowed':
        return SignUpExceptionCode.firebaseOperationNotAllowed;
        break;
      case 'weak-password':
        return SignUpExceptionCode.firebaseWeakPassword;
        break;
      case 'unknown':
        return SignUpExceptionCode.firebaseUnknownCode;
        break;
      default:
        return SignUpExceptionCode.unsupportedCode;
        break;
    }
  }

  SignInExceptionCode get asSignInEnumCode {
    switch (code) {
      case 'invalid-email':
        return SignInExceptionCode.firebaseInvalidEmail;
        break;
      case 'wrong-password':
        return SignInExceptionCode.firebaseWrongPassword;
        break;
      case 'user-disabled':
        return SignInExceptionCode.firebaseUserDisabled;
        break;
      case 'user-not-found':
        return SignInExceptionCode.firebaseUserNotFound;
        break;
      default:
        return SignInExceptionCode.unsupportedCode;
        break;
    }
  }
}
