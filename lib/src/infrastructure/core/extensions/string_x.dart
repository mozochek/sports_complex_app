import 'package:sports_complex_app/src/domain/user/user.dart';

extension StringX on String {
  bool get isEmailValid =>
      RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
      )
          .hasMatch(this);

  UserRole get asUserRole {
    switch (this) {
      case 'user':
        return UserRole.user;
      case 'moderator':
        return UserRole.moderator;
      case 'admin':
        return UserRole.admin;
      case 'unknown':
      default:
        return UserRole.unknown;
    }
  }
}
