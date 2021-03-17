// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    personalData:
        PersonalData.fromJson(json['personalData'] as Map<String, dynamic>),
    authData: AuthData.fromJson(json['authData'] as Map<String, dynamic>),
    role: _$enumDecode(_$RoleEnumMap, json['role']),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'personalData': instance.personalData.toJson(),
      'authData': instance.authData.toJson(),
      'role': _$RoleEnumMap[instance.role],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$RoleEnumMap = {
  Role.unknown: 'unknown',
  Role.user: 'user',
  Role.coach: 'coach',
  Role.admin: 'admin',
};
