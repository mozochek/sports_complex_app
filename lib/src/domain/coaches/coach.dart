import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'coach.g.dart';

@JsonSerializable()
class Coach {
  Coach({
    required this.id,
    required this.surname,
    required this.name,
    required this.patronymic,
  });

  factory Coach.empty() => Coach(
        id: const Uuid().v4(),
        surname: '',
        name: '',
        patronymic: '',
      );

  factory Coach.fromJson(Map<String, dynamic> json) => _$CoachFromJson(json);

  // TODO: !
  factory Coach.fromFirestore(QueryDocumentSnapshot doc) =>
      Coach.fromJson(doc.data()!);

  final String id;
  String surname;
  String name;
  String patronymic;

  Map<String, dynamic> toJson() => _$CoachToJson(this);

  Coach copy() => Coach(
        id: id,
        surname: surname,
        name: name,
        patronymic: patronymic,
      );

  bool get isEmpty => surname.isEmpty && name.isEmpty && patronymic.isEmpty;

  bool get isNotEmpty => surname.isNotEmpty && name.isNotEmpty && patronymic.isNotEmpty;

  String get fullName => '$surname $name $patronymic';
}
