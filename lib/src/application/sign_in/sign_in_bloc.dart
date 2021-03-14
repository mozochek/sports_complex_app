import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/src/application/sign_in/i_sign_in_bloc.dart';
import 'package:sports_complex_app/src/domain/auth/i_auth.dart';
import 'package:sports_complex_app/src/domain/core/exceptions/sign_in_exception.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/infrastructure/auth/sign_in_exception_code.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/string_x.dart';

@Injectable(
  as: ISignInBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class SignInBloc extends ISignInBloc with SignInValidator {
  SignInBloc(this._auth);

  final IAuth _auth;
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  final UserAuthData _userAuthData = UserAuthData.empty();

  @override
  Stream<String> get email => _email.stream.transform(_validateEmail);

  StreamTransformer<String, String> get _validateEmail =>
      StreamTransformer.fromHandlers(
        handleData: (rawEmail, sink) {
          final email = rawEmail.trim();
          _userAuthData.email = email;
          sink.add(email);
          if (!isEmailCorrect(email)) {
            // TODO: add localization
            sink.addError('Введите корректный адрес эл.почты');
          }
        },
      );

  @override
  ChangeEmail get changeEmail => _email.sink.add;

  @override
  Stream<String> get password => _password.stream.transform(_validatePassword);

  StreamTransformer<String, String> get _validatePassword =>
      StreamTransformer.fromHandlers(
        handleData: (rawPassword, sink) {
          final password = rawPassword.trim();
          _userAuthData.password = password;
          sink.add(password);
          if (!isPasswordCorrect(password)) {
            // TODO: add localization
            sink.addError('Длина пароля должна быть не менее 6 символов');
          }
        },
      );

  @override
  ChangePassword get changePassword => _password.sink.add;

  // TODO: rework this check with cached object (not streams)
  @override
  Stream<bool> get isSignInAllowed => Rx.combineLatest2<String, String, bool>(
        email,
        password,
        (a, b) => isEmailCorrect(a) && isPasswordCorrect(b),
      );

  @override
  Future<void> signIn() async {
    // TODO: refactor
    try {
      await _auth.signInWithEmailAndPassword(_userAuthData);
    } on SignInException catch (e) {
      debugPrint(
        'Application layer: inside $runtimeType: catch ${e.runtimeType}: ${e.enumCode}: ${e.description}',
      );
      switch (e.enumCode) {
        case SignInExceptionCode.firebaseInvalidEmail:
          // TODO: add behavior(as some pop up stuff)
          _email.sink.addError(e.description);
          break;
        case SignInExceptionCode.firebaseWrongPassword:
          // TODO: add behavior(as some pop up stuff)
          _email.sink.addError(e.description);
          break;
        case SignInExceptionCode.firebaseUserDisabled:
          // TODO: add behavior(as some pop up stuff)
          _email.sink.addError(e.description);
          break;
        case SignInExceptionCode.firebaseUserNotFound:
          // TODO: add behavior(as some pop up stuff)
          _email.sink.addError(e.description);
          break;
        case SignInExceptionCode.firebaseTooManyRequests:
          _email.sink.addError(e.description);
          break;
        case SignInExceptionCode.userDataIsEmpty:
          _email.sink.addError(e.description);
          break;
        case SignInExceptionCode.unsupportedCode:
          // TODO: add behavior(as some pop up stuff)
          _email.sink.addError(e.description);
          break;
      }
    }
  }

  @override
  Future<void> dispose() async {
    await _email.close();
    await _password.close();
  }
}

// TODO: extract into AuthValidator
mixin SignInValidator {
  bool isEmailCorrect(String email) => email.isEmailValid;

  bool isPasswordCorrect(String password) => password.length > 5;
}
