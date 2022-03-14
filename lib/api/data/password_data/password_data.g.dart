// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordData _$PasswordDataFromJson(Map<String, dynamic> json) => PasswordData(
      new_password: json['new_password'] as String,
      old_password: json['old_password'] as String,
    );

Map<String, dynamic> _$PasswordDataToJson(PasswordData instance) =>
    <String, dynamic>{
      'new_password': instance.new_password,
      'old_password': instance.old_password,
    };
