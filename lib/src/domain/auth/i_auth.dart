import 'package:sports_complex_app/src/domain/user/user.dart';

// TODO: maybe break up on 3 classes
abstract class IAuth {
  Future<void> signUpWithEmailAndPassword(UserData userData);

  Future<void> signInWithEmailAndPassword(UserAuthData userAuthData);

  Future<void> signOut();
}
