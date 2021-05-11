import 'package:sports_complex_app/src/domain/user/auth_data.dart';
import 'package:sports_complex_app/src/domain/user/personal_data.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';

abstract class IAuth {
  /// Creates a new user with given [PersonalData] and [AuthData]
  Future<User?> signUp(PersonalData userPersonalData, AuthData userAuthData);

  /// Performs an user authentication with given [AuthData]
  Future<User?> signInWithAuthData(AuthData userAuthData);

  /// Performs user sign out
  Future<void> signOut();
}
