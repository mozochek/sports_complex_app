import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:sports_complex_app/src/domain/user/auth_data.dart';
import 'package:sports_complex_app/src/domain/user/personal_data.dart';
import 'package:sports_complex_app/src/domain/user/role.dart';

part 'user.g.dart';

// TODO: add json serializable
@JsonSerializable()
class User {
  User({
    required this.id,
    required this.personalData,
    required this.authData,
    required this.role,
  });

  factory User.createNewFrom({
    required PersonalData personalData,
    required AuthData authData,
  }) =>
      User(
        id: const Uuid().v4(),
        personalData: personalData,
        authData: authData,
        role: Role.user,
      );

  factory User.empty() => User(
        id: const Uuid().v4(),
        personalData: PersonalData.empty(),
        authData: AuthData(),
        role: Role.user,
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // TODO: !
  factory User.fromFirestore(QueryDocumentSnapshot doc) =>
      User.fromJson(doc.data()!);

  final String id;
  final PersonalData personalData;
  final AuthData authData;
  Role role;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String get fullName => '${personalData.surname} ${personalData.name}';

  bool get isAdmin => role == Role.admin;
}
