import 'package:sports_complex_app/src/domain/core/repositories/user_watcher_mixin.dart';
import 'package:sports_complex_app/src/domain/core/repositories/watcher_mixin.dart';
import 'package:sports_complex_app/src/domain/user/auth_data.dart';
import 'package:sports_complex_app/src/domain/user/personal_data.dart';
import 'package:sports_complex_app/src/domain/user/role.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';

abstract class IUserRepository with WatcherMixin<User>, UserWatcherMixin {
  Future<User> createUser(PersonalData personalData, AuthData authData);

  Future<User> getUser(AuthData authData);

  Future<Stream<User>> userStream(AuthData authData);

  Future<void> updateUserRole(User user, Role role);
}
