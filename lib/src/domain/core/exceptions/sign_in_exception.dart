import 'package:sports_complex_app/src/domain/core/exceptions/sports_complex_exception.dart';
import 'package:sports_complex_app/src/infrastructure/auth/sign_in_exception_code.dart';

class SignInException extends SportsComplexException {
  SignInException._(
    String description,
    this._enumCode,
  ) : super(description);

  factory SignInException.fromEnumCode(SignInExceptionCode enumCode) =>
      SignInException._(
        enumCode.description,
        enumCode,
      );

  final SignInExceptionCode _enumCode;

  SignInExceptionCode get enumCode => _enumCode;

  @override
  String toString() => '$runtimeType(${super.toString()}, $_enumCode)';
}
