import 'package:sports_complex_app/src/infrastructure/auth/sign_in_exception_code.dart';
import 'package:sports_complex_app/src/infrastructure/auth/sign_up_exception_code.dart';

class UserRepositoryException implements Exception {
  UserRepositoryException(
    this._code,
  );

  /// Code representation of an exception
  final String _code;

  String get code => _code;

  static const String invalidUserSurname = 'invalid-user-surname';

  static const String invalidUserName = 'invalid-user-name';

  static const String invalidEmail = 'invalid-email';

  static const String userDataIsEmpty = 'user-data-is-empty';

  static const String unknown = 'unknown';

  SignUpExceptionCode get asSignUpEnumCode {
    switch (code) {
      case invalidUserSurname:
        return SignUpExceptionCode.invalidUserSurname;
      case invalidUserName:
        return SignUpExceptionCode.invalidUserName;
      case invalidEmail:
        return SignUpExceptionCode.invalidEmail;
      default:
        return SignUpExceptionCode.unsupportedCode;
    }
  }

  SignInExceptionCode get asSignInEnumCode {
    switch (code) {
      case userDataIsEmpty:
        return SignInExceptionCode.userDataIsEmpty;
      default:
        return SignInExceptionCode.unsupportedCode;
    }
  }

  @override
  String toString() => '$runtimeType{_code: $_code}';
}
