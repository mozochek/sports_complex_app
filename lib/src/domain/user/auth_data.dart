import 'package:json_annotation/json_annotation.dart';

part 'auth_data.g.dart';

@JsonSerializable()
class AuthData {
  AuthData({
    this.email = '',
    this.password = '',
  });

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  String email;
  @JsonKey(ignore: true)
  String password;

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
