import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'hall.g.dart';

@JsonSerializable()
class Hall {
  Hall({
    @required this.id,
    this.name,
  });

  factory Hall.empty() => Hall(
        id: Uuid().v4(),
        name: '',
      );

  factory Hall.fromJson(Map<String, dynamic> json) => _$HallFromJson(json);

  factory Hall.fromFirestore(QueryDocumentSnapshot doc) =>
      Hall.fromJson(doc.data());

  final String id;
  String name;

  Map<String, dynamic> toJson() => _$HallToJson(this);

  Hall copy() => Hall(
        id: id,
        name: name,
      );
}
