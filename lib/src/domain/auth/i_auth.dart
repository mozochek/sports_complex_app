import 'package:sports_complex_app/src/domain/user/user.dart';

abstract class IAuth {
  Future<void> signUpWithEmailAndPassword(User user);

  Future<void> signInWithEmailAndPassword(UserAuthData userAuthData);

  Future<void> signOut();
}
