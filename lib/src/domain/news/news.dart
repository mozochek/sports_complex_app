import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:sports_complex_app/src/domain/cloneable_mixin.dart';
import 'package:sports_complex_app/src/domain/user/user.dart';
import 'package:sports_complex_app/src/infrastructure/core/json_converters/json_converters.dart';

part 'news.g.dart';

@JsonSerializable()
class News with Cloneable<News> {
  News({
    required this.id,
    required this.title,
    required this.body,
    required this.author,
    required this.timeStamp,
  });

  factory News.empty() => News(
        id: const Uuid().v4(),
        title: '',
        body: '',
        author: User.empty(),
        timeStamp: DateTime.now(),
      );

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  factory News.fromFirestore(QueryDocumentSnapshot doc) =>
      News.fromJson(doc.data());

  final String id;
  String title;
  String body;
  User author;
  @dateTimeConverter
  DateTime? timeStamp;

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  @override
  News clone() => News(
        id: id,
        title: title,
        body: body,
        author: author,
        timeStamp: timeStamp,
      );
}
