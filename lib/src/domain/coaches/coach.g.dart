// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coach _$CoachFromJson(Map<String, dynamic> json) {
  return Coach(
    id: json['id'] as String,
    surname: json['surname'] as String,
    name: json['name'] as String,
    patronymic: json['patronymic'] as String,
  );
}

Map<String, dynamic> _$CoachToJson(Coach instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'patronymic': instance.patronymic,
    };
