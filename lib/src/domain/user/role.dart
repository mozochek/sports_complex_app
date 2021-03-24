import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sports_complex_app/generated/l10n.dart';
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

  String get asReadableString {
    switch (this) {
      case Role.unknown:
        return S.current.unknown_text;
      case Role.user:
        return S.current.user_text;
      case Role.coach:
        return S.current.coach_text;
      case Role.admin:
        return S.current.admin_text;
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

  Widget get asIcon {
    switch (this) {
      case Role.unknown:
        return IconButton(
          tooltip: S.current.unknown_text,
          onPressed: null,
          icon: const FaIcon(
            FontAwesomeIcons.question,
          ),
        );
      case Role.user:
        return IconButton(
          tooltip: S.current.user_text,
          onPressed: null,
          icon: const FaIcon(
            FontAwesomeIcons.userAlt,
            color: Colors.green,
          ),
        );
      case Role.coach:
        return IconButton(
          splashRadius: 0.1,
          tooltip: S.current.coach_text,
          onPressed: null,
          icon: const FaIcon(
            FontAwesomeIcons.users,
            color: Colors.deepPurple,
          ),
        );
      case Role.admin:
        return IconButton(
          tooltip: S.current.admin_text,
          onPressed: null,
          icon: const FaIcon(
            FontAwesomeIcons.userShield,
            color: Colors.red,
          ),
        );
    }
  }
}
