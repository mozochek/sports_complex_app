import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class User {
  User._({
    this.id,
    this.data,
  });

  factory User.fromUserData(UserData data) => User._(
        id: Uuid().v4(),
        data: data,
      );

  final String id;
  final UserData data;

  String get fullName =>
      '${data.additionalInfo.surname} ${data.additionalInfo.name}';

  @override
  String toString() => '$runtimeType(id: $id, data: $data)';
}

class UserData {
  UserData({
    @required this.additionalInfo,
    @required this.authData,
  });

  final UserAdditionalInfo additionalInfo;
  final UserAuthData authData;

  @override
  String toString() =>
      '$runtimeType(additionalInfo: $additionalInfo, authData: $authData)';
}

class UserAuthData {
  UserAuthData({
    @required this.email,
    @required this.password,
  });

  final String email;
  final String password;

  @override
  String toString() => '$runtimeType(email: $email, password: $password)';
}

class UserAdditionalInfo {
  UserAdditionalInfo({
    @required this.surname,
    @required this.name,
  });

  final String surname;
  final String name;

  @override
  String toString() => '$runtimeType(surname: $surname, name: $name)';
}
