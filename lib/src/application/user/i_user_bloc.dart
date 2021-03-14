import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/user_state.dart';

abstract class IUserBloc {
  User? get currentUser;

  void addUserState(UserState state);

  void addUser(User? user);

  Future<void> dispose();
}