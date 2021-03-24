import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'package:sports_complex_app/src/application/user/i_user_bloc.dart';
import 'package:sports_complex_app/injection.dart';
import 'package:sports_complex_app/src/domain/auth/i_auth.dart';
import 'package:sports_complex_app/src/domain/core/exceptions/sign_in_exception.dart';
import 'package:sports_complex_app/src/domain/core/exceptions/sign_up_exception.dart';
import 'package:sports_complex_app/src/domain/user/auth_data.dart';
import 'package:sports_complex_app/src/domain/user/personal_data.dart';
import 'package:sports_complex_app/src/domain/user/user_auth_state.dart';
import 'package:sports_complex_app/src/infrastructure/core/exceptions/user_repository_exception.dart';
import 'package:sports_complex_app/src/infrastructure/user/i_user_repository.dart';
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
  final IUserRepository _userRepository;

  @override
  Future<void> signUp(
    PersonalData userPersonalData,
    AuthData userAuthData,
  ) async {
    try {
      // Trying to write given user data
      final createdUser = await _userRepository.createUser(
        userPersonalData,
        userAuthData,
      );
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: createdUser.authData.email,
        password: createdUser.authData.password,
      );
      // Get to this point mean that user was created successfully so we
      // add user in bloc and update auth state
      getIt<IUserBloc>()
          // ..addUser(createdUser)
          .addUserAuthState(UserAuthState.signedUp);
      // TODO: improve caching
      // Simple temporary caching
      final box = await Hive.openBox<String>('auth');
      await box.put(
        'email',
        createdUser.authData.email,
      );
      await box.close();
    } on FirebaseAuthException catch (e) {
      throw SignUpException.fromEnumCode(e.asSignUpEnumCode);
    } on UserRepositoryException catch (e) {
      throw SignUpException.fromEnumCode(e.asSignUpEnumCode);
    }
  }

  @override
  Future<void> signInWithAuthData(AuthData userAuthData) async {
    try {
      // Trying to perform sign in with firebase auth
      await _firebaseAuth.signInWithEmailAndPassword(
        email: userAuthData.email,
        password: userAuthData.password,
      );
      // Get to this point means that userAuthData is correct and user exist
      // Then we get all user data from firestore
      final user = await _userRepository.getUser(userAuthData);
      // Adding user in bloc and updating auth state
      getIt<IUserBloc>()
        ..addUserAuthState(UserAuthState.signedIn)
        ..addUser(user);
    } on FirebaseAuthException catch (e) {
      debugPrint(
        'Infrastructure layer: inside $runtimeType: catch ${e.runtimeType}: code: ${e.code} | message: ${e.message} | email: ${e.email}',
      );
      throw SignInException.fromEnumCode(e.asSignInEnumCode);
    } on UserRepositoryException catch (e) {
      debugPrint(
        'Application layer: inside $runtimeType: catch ${e.runtimeType}: ${e.code}',
      );
      throw SignInException.fromEnumCode(e.asSignInEnumCode);
    }
  }

  @override
  Future<void> signOut() async {
    // Perform sign out in firebase
    await _firebaseAuth.signOut();
    // Removing user from bloc and updating auth state
    getIt<IUserBloc>()
      ..addUserAuthState(UserAuthState.signedOut)
      ..addUser(null);
  }
}
