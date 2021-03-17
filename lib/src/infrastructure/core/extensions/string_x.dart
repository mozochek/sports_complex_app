import 'package:sports_complex_app/src/domain/user/role.dart';

extension StringX on String {
  bool get isEmailValid => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  Role get asRole {
    switch (this) {
      case 'user':
        return Role.user;
      case 'coach':
        return Role.coach;
      case 'admin':
        return Role.admin;
      case 'unknown':
      default:
        return Role.unknown;
    }
  }
}
