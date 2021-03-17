import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/domain/user/role.dart';

abstract class IUserActorBloc {
  Future<void> updateUserRole(User user, Role newRole);

  Future<void> banUser(User user);
}
