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

  SignUpExceptionCode get asSignUpEnumCode {
    switch (code) {
      case invalidUserSurname:
        return SignUpExceptionCode.invalidUserSurname;
        break;
      case invalidUserName:
        return SignUpExceptionCode.invalidUserName;
        break;
      case invalidEmail:
        return SignUpExceptionCode.invalidEmail;
        break;
      default:
        return SignUpExceptionCode.unsupportedCode;
        break;
    }
  }

  @override
  String toString() => '$runtimeType($_code)';
}
