import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_data.g.dart';

@JsonSerializable()
class PersonalData {
  PersonalData({
    required this.surname,
    required this.name,
  });

  factory PersonalData.empty() => PersonalData(
        surname: '',
        name: '',
      );

  factory PersonalData.fromJson(Map<String, dynamic> json) =>
      _$PersonalDataFromJson(json);

  factory PersonalData.fromFirestore(QueryDocumentSnapshot doc) =>
      PersonalData.fromJson(doc.data()!);

  String surname;
  String name;

  Map<String, dynamic> toJson() => _$PersonalDataToJson(this);
}
