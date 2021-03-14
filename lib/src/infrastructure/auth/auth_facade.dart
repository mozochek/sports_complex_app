import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/domain/auth/i_auth.dart';
import 'package:sports_complex_app/src/domain/core/exceptions/sign_in_exception.dart';
import 'package:sports_complex_app/src/domain/core/exceptions/sign_up_exception.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/user_state.dart';
import 'package:sports_complex_app/src/infrastructure/core/exceptions/user_repository_exception.dart';
import 'package:sports_complex_app/src/infrastructure/user/user_repository.dart';
import 'package:sports_complex_app/src/infrastructure/core/extensions/firebase_auth_exception_x.dart';

@Injectable(
  as: IAuth,
  env: [
    Environment.dev,
    Environment.prod,
  ],
)
class AuthFacade extends IAuth {
  AuthFacade(this._firebaseAuth, this._userRepository);

  final FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;

  @override
  Future<void> signUpWithEmailAndPassword(User user) async {
    try {
      await _userRepository.saveUserData(user);
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.authData.email,
        password: user.authData.password,
      );
      getIt<IUserBloc>().addUserState(UserState.signedUp);
      await Hive.box<String>('auth').put(
        'email',
        user.authData.email,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(
        'Infrastructure layer: inside $runtimeType: catch ${e.runtimeType}: code: ${e.code} | message: ${e.message}',
      );
      throw SignUpException.fromEnumCode(e.asSignUpEnumCode);
    } on UserRepositoryException catch (e) {
      debugPrint(
        'Infrastructure layer: inside $runtimeType: catch ${e.runtimeType}: code: ${e.code} |',
      );
      throw SignUpException.fromEnumCode(e.asSignUpEnumCode);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(UserAuthData userAuthData) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: userAuthData.email,
        password: userAuthData.password,
      );
      final user = await _userRepository.getUser(userAuthData);
      await Hive.box<String>('auth').put(
        'email',
        userAuthData.email,
      );
      getIt<IUserBloc>()
        ..addUserState(UserState.signedIn)
        ..addUser(user);
    } on FirebaseAuthException catch (e) {
      debugPrint(
        'Infrastructure layer: inside $runtimeType: catch ${e.runtimeType}: code: ${e.code} | message: ${e.message}',
      );
      throw SignInException.fromEnumCode(e.asSignInEnumCode);
    } on UserRepositoryException catch (e) {
      debugPrint(
        'Infrastructure layer: inside $runtimeType: catch ${e.runtimeType}: code: ${e.code} |',
      );
      throw SignInException.fromEnumCode(e.asSignInEnumCode);
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    getIt<IUserBloc>()
      ..addUserState(UserState.signedOut)
      ..addUser(null);
  }
}
