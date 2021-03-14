import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

// TODO: move all classes to their own files
// TODO: add json serializable
class User {
  User._({
    required this.id,
    required this.additionalInfo,
    required this.authData,
    required this.role,
  });

  factory User.empty() => User._(
        id: const Uuid().v4(),
        additionalInfo: UserAdditionalInfo.empty(),
        authData: UserAuthData.empty(),
        role: UserRole.user,
      );

  factory User.fromData({
    required UserAdditionalInfo additionalInfo,
    required UserAuthData authData,
    required UserRole role,
  }) =>
      User._(
        id: const Uuid().v4(),
        additionalInfo: additionalInfo,
        authData: authData,
        role: role,
      );

  final String id;
  final UserAdditionalInfo additionalInfo;
  final UserAuthData authData;
  UserRole role;

  String get fullName => '${additionalInfo.surname} ${additionalInfo.name}';
}

class UserAuthData {
  UserAuthData({
    required this.email,
    required this.password,
  });

  factory UserAuthData.empty() => UserAuthData(
        email: '',
        password: '',
      );

  String email;
  String password;

  @override
  String toString() => '$runtimeType(email: $email, password: $password)';
}

class UserAdditionalInfo {
  UserAdditionalInfo({
    required this.surname,
    required this.name,
  });

  factory UserAdditionalInfo.empty() => UserAdditionalInfo(
        surname: '',
        name: '',
      );

  factory UserAdditionalInfo.fromJson(Map<String, dynamic> json) =>
      UserAdditionalInfo(
        surname: json['surname'] as String,
        name: json['name'] as String,
      );

  factory UserAdditionalInfo.fromFirestore(DocumentSnapshot doc) =>
      UserAdditionalInfo(
        surname: doc.data()!['surname'] as String,
        name: doc.data()!['name'] as String,
      );

  String surname;
  String name;

  @override
  String toString() => '$runtimeType(surname: $surname, name: $name)';
}

enum UserRole {
  unknown,
  user,
  moderator,
  admin,
}

extension UserRoleX on UserRole {
  String get asString {
    switch (this) {
      case UserRole.unknown:
        return 'unknown';
      case UserRole.user:
        return 'user';
      case UserRole.moderator:
        return 'moderator';
      case UserRole.admin:
        return 'admin';
    }
  }
}
