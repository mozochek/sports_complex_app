import 'package:sports_complex_app/src/domain/core/exceptions/sports_complex_exception.dart';
import 'package:sports_complex_app/src/infrastructure/auth/sign_up_exception_code.dart';

class SignUpException extends SportsComplexException {
  SignUpException._(
    String description,
    this._enumCode,
  ) : super(description);

  factory SignUpException.fromEnumCode(SignUpExceptionCode enumCode) =>
      SignUpException._(
        enumCode.description,
        enumCode,
      );

  final SignUpExceptionCode _enumCode;

  SignUpExceptionCode get enumCode => _enumCode;

  @override
  String toString() => '$runtimeType(${super.toString()}, $_enumCode)';
}
