// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalData _$PersonalDataFromJson(Map<String, dynamic> json) {
  return PersonalData(
    surname: json['surname'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$PersonalDataToJson(PersonalData instance) =>
    <String, dynamic>{
      'surname': instance.surname,
      'name': instance.name,
    };
