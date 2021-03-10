import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sports_complex_app/src/application/sign_up/i_sign_up_bloc.dart';
import 'package:sports_complex_app/src/domain/auth/i_auth.dart';
import 'package:sports_complex_app/src/domain/core/exceptions/sign_up_exception.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/infrastructure/auth/sign_up_exception_code.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/string_x.dart';

@Injectable(
  as: ISignUpBloc,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class SignUpBloc extends ISignUpBloc with SignUpValidator {
  SignUpBloc(this._auth);

  final IAuth _auth;
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _userSurname = BehaviorSubject<String>();
  final _userName = BehaviorSubject<String>();

  @override
  Stream<String> get userSurname =>
      _userSurname.stream.transform(_validateUserSurname);

  StreamTransformer<String, String> get _validateUserSurname =>
      StreamTransformer.fromHandlers(
        handleData: (rawUserSurname, sink) {
          final userSurname = rawUserSurname.trim();
          sink.add(userSurname);
          if (!isUserSurnameCorrect(userSurname)) {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Фамилия должна состоять из 2 или более символов');
          }
        },
      );

  @override
  ChangeSurname get changeSurname => _userSurname.sink.add;

  @override
  Stream<String> get userName => _userName.stream.transform(_validateUserName);

  StreamTransformer<String, String> get _validateUserName =>
      StreamTransformer.fromHandlers(
        handleData: (rawUserName, sink) {
          final userName = rawUserName.trim();
          sink.add(userName);
          if (!isUserNameCorrect(userName)) {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Имя должно состоять из 2 или более символов');
          }
        },
      );

  @override
  ChangeName get changeName => _userName.sink.add;

  @override
  Stream<String> get email => _email.stream.transform(_validateEmail);

  StreamTransformer<String, String> get _validateEmail =>
      StreamTransformer.fromHandlers(
        handleData: (rawEmail, sink) {
          final email = rawEmail.trim();
          sink.add(email);
          if (!isEmailCorrect(email)) {
            // TODO: add localization
            // TODO: add error sending via error object
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
          sink.add(password);
          if (!isPasswordCorrect(password)) {
            // TODO: add localization
            // TODO: add error sending via error object
            sink.addError('Длина пароля должна быть не менее 6 символов');
          }
        },
      );

  @override
  ChangePassword get changePassword => _password.sink.add;

  @override
  Stream<bool> get isSignUpAllowed =>
      Rx.combineLatest4<String, String, String, String, bool>(
        userSurname,
        userName,
        email,
        password,
        (a, b, c, d) =>
            isUserSurnameCorrect(a) &&
            isUserNameCorrect(b) &&
            isEmailCorrect(c) &&
            isPasswordCorrect(d),
      );

  @override
  Future<void> signUp() async {
    try {
      await _auth.signUpWithEmailAndPassword(_userData);
    } on SignUpException catch (e) {
      debugPrint(
        'Application layer: inside $runtimeType: catch ${e.runtimeType}: ${e.enumCode}: ${e.description}',
      );
      switch (e.enumCode) {
        case SignUpExceptionCode.firebaseEmailAlreadyInUse:
          _email.sink.addError(e.description);
          break;
        case SignUpExceptionCode.firebaseWeakPassword:
          _password.sink.addError(e.description);
          break;
        case SignUpExceptionCode.firebaseOperationNotAllowed:
          // TODO: add behavior(as some pop up stuff)
          _password.sink.addError(e.description);
          break;
        case SignUpExceptionCode.invalidUserSurname:
          _userSurname.sink.addError(e.description);
          break;
        case SignUpExceptionCode.invalidUserName:
          _userName.sink.addError(e.description);
          break;
        case SignUpExceptionCode.invalidEmail:
          _email.sink.addError(e.description);
          break;
        case SignUpExceptionCode.firebaseUnknownCode:
          // TODO: add behavior(as some pop up stuff)
          _password.sink.addError(e.description);
          break;
        case SignUpExceptionCode.unsupportedCode:
          // TODO: add behavior(as some pop up stuff)
          _password.sink.addError(e.description);
          break;
      }
    }
  }

  UserData get _userData => UserData(
        authData: UserAuthData(
          email: _email.value,
          password: _password.value,
        ),
        additionalInfo: UserAdditionalInfo(
          surname: _userSurname.value,
          name: _userName.value,
        ),
      );

  @override
  Future<void> dispose() async {
    await _email.close();
    await _password.close();
    await _userSurname.close();
    await _userName.close();
  }
}

mixin SignUpValidator {
  bool isUserSurnameCorrect(String userSurname) => userSurname.length > 1;

  bool isUserNameCorrect(String userName) => userName.length > 1;

  // TODO: extract into AuthValidator
  bool isEmailCorrect(String email) => email.isEmailValid;

  bool isPasswordCorrect(String password) => password.length > 5;
}
