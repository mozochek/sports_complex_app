import 'package:sports_complex_app/src/domain/user/user.dart';

mixin UserWatcherMixin {
  Stream<User> watchUser(User user);
}