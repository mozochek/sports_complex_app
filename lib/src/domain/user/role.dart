import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/src/infrastructure/core/extensions/string_x.dart';

enum Role {
  unknown,
  user,
  coach,
  admin,
}

extension RoleX on Role {
  Map<String, dynamic> toJson() => <String, dynamic>{
        'role': asString,
      };

  Role fromJson(Map<String, dynamic> json) => (json['role'] as String).asRole;

  // TODO: add localization
  String get asReadableString {
    switch (this) {
      case Role.unknown:
        return 'Неизвестно';
      case Role.user:
        return 'Пользователь';
      case Role.coach:
        return 'Тренер';
      case Role.admin:
        return 'Администратор';
    }
  }

  String get asString {
    switch (this) {
      case Role.unknown:
        return 'unknown';
      case Role.user:
        return 'user';
      case Role.coach:
        return 'coach';
      case Role.admin:
        return 'admin';
    }
  }

  // TODO: add localization
  Widget get asIcon {
    switch (this) {
      case Role.unknown:
        return const IconButton(
          tooltip: 'Неизветсно',
          onPressed: null,
          icon: FaIcon(
            FontAwesomeIcons.question,
          ),
        );
      case Role.user:
        return const IconButton(
          tooltip: 'Пользователь',
          onPressed: null,
          icon: FaIcon(
            FontAwesomeIcons.userAlt,
            color: Colors.green,
          ),
        );
      case Role.coach:
        return const IconButton(
          splashRadius: 0.1,
          tooltip: 'Тренер',
          onPressed: null,
          icon: FaIcon(
            FontAwesomeIcons.users,
            color: Colors.deepPurple,
          ),
        );
      case Role.admin:
        return const IconButton(
          tooltip: 'Администратор',
          onPressed: null,
          icon: FaIcon(
            FontAwesomeIcons.userShield,
            color: Colors.red,
          ),
        );
    }
  }
}
