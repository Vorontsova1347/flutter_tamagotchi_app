// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_update_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordUpdateData _$PasswordUpdateDataFromJson(Map<String, dynamic> json) =>
    PasswordUpdateData(
      new_password: json['new_password'] as String,
      old_password: json['old_password'] as String,
    );

Map<String, dynamic> _$PasswordUpdateDataToJson(PasswordUpdateData instance) =>
    <String, dynamic>{
      'new_password': instance.new_password,
      'old_password': instance.old_password,
    };
