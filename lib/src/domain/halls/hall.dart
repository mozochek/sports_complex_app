import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:sports_complex_app/src/domain/cloneable_mixin.dart';

part 'hall.g.dart';

@JsonSerializable()
class Hall with Cloneable<Hall> {
  Hall({
    required this.id,
    required this.name,
  });

  factory Hall.empty() => Hall(
        id: const Uuid().v4(),
        name: '',
      );

  factory Hall.fromJson(Map<String, dynamic> json) => _$HallFromJson(json);

  factory Hall.fromFirestore(QueryDocumentSnapshot doc) =>
      Hall.fromJson(doc.data());

  final String id;
  String name;

  Map<String, dynamic> toJson() => _$HallToJson(this);

  @override
  Hall clone() => Hall(
        id: id,
        name: name,
      );

  bool get isEmpty => name.isEmpty;

  bool get isNotEmpty => name.isNotEmpty;
}
