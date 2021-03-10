import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'coach.g.dart';

@JsonSerializable()
class Coach {
  Coach({
    @required this.id,
    this.surname,
    this.name,
    this.patronymic,
  });

  factory Coach.empty() => Coach(
        id: Uuid().v4(),
        surname: '',
        name: '',
        patronymic: '',
      );

  factory Coach.fromJson(Map<String, dynamic> json) => _$CoachFromJson(json);

  factory Coach.fromFirestore(QueryDocumentSnapshot doc) =>
      Coach.fromJson(doc.data());

  final String id;
  String surname;
  String name;
  String patronymic;

  Map<String, dynamic> toJson() => _$CoachToJson(this);

  String get fullName => '$surname $name ${patronymic ?? ''}';
}
