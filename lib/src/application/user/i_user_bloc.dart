import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/user_auth_state.dart';

abstract class IUserBloc {
  Stream<User?> get currentUserStream;

  User? get currentUser;

  void addUserAuthState(UserAuthState state);

  void addUser(User? user);
}
