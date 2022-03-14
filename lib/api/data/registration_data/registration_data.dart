// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'registration_data.g.dart';

@JsonSerializable()
class RegistrationData {
  final String login;
  final String password;
  final String tamagochi_name;
  final String tamagochi_gender;

  RegistrationData({
    required this.login,
    required this.password,
    required this.tamagochi_name,
    required this.tamagochi_gender,
  });

  factory RegistrationData.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDataFromJson(json);

  @override
  String toString() {
    return 'RegistrationData: {\n login: $login,\n password: $password,\n tamagochi_gender: $tamagochi_gender,\n, tamagochi_name: $tamagochi_name,\n}';
  }

  Map<String, dynamic> toJson() => _$RegistrationDataToJson(this);
}
