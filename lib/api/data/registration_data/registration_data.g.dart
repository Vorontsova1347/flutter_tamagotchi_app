// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationData _$RegistrationDataFromJson(Map<String, dynamic> json) =>
    RegistrationData(
      login: json['login'] as String,
      password: json['password'] as String,
      tamagochi_name: json['tamagochi_name'] as String,
      tamagochi_gender: json['tamagochi_gender'] as String,
    );

Map<String, dynamic> _$RegistrationDataToJson(RegistrationData instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
      'tamagochi_name': instance.tamagochi_name,
      'tamagochi_gender': instance.tamagochi_gender,
    };
