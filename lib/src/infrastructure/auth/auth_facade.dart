import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/user/user_bloc.dart';
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
  Future<void> signUpWithEmailAndPassword(UserData userData) async {
    try {
      await _userRepository.saveUserAdditionalInfo(userData);
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: userData.authData.email,
        password: userData.authData.password,
      );
      getIt<UserBloc>().addUserState(UserState.signedUp);
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
      final userAdditionalInfo =
          await _userRepository.getUserAdditionalInfo(userAuthData);
      final user = User.fromUserData(
        UserData(
          authData: userAuthData,
          additionalInfo: userAdditionalInfo,
        ),
      );
      getIt<UserBloc>()
        ..addUserState(UserState.signedIn)
        ..addUser(user);
    } on FirebaseAuthException catch (e) {
      debugPrint(
        'Infrastructure layer: inside $runtimeType: catch ${e.runtimeType}: code: ${e.code} | message: ${e.message}',
      );
      throw SignInException.fromEnumCode(e.asSignInEnumCode);
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    getIt<UserBloc>().addUserState(UserState.signedOut);
  }
}
