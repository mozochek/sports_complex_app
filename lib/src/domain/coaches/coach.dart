import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:sports_complex_app/src/domain/cloneable_mixin.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';

part 'coach.g.dart';

@JsonSerializable()
class Coach with Cloneable<Coach> {
  Coach({
    required this.id,
    required this.surname,
    required this.name,
  });

  factory Coach.empty() => Coach(
        id: const Uuid().v4(),
        surname: '',
        name: '',
      );

  factory Coach.fromUser(User user) => Coach(
        id: user.id,
        surname: user.personalData.surname,
        name: user.personalData.name,
      );

  factory Coach.fromJson(Map<String, dynamic> json) => _$CoachFromJson(json);

  factory Coach.fromFirestore(QueryDocumentSnapshot doc) =>
      Coach.fromJson(doc.data());

  final String id;
  String surname;
  String name;

  Map<String, dynamic> toJson() => _$CoachToJson(this);

  @override
  Coach clone() => Coach(
        id: id,
        surname: surname,
        name: name,
      );

  bool get isEmpty => surname.isEmpty && name.isEmpty;

  bool get isNotEmpty => surname.isNotEmpty && name.isNotEmpty;

  String get fullName => '$surname $name';
}
