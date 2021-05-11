// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    id: json['id'] as String,
    title: json['title'] as String,
    body: json['body'] as String,
    author: User.fromJson(json['author'] as Map<String, dynamic>),
    timeStamp:
        dateTimeConverter.fromJson(json['timeStamp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'author': instance.author.toJson(),
      'timeStamp': dateTimeConverter.toJson(instance.timeStamp),
    };
