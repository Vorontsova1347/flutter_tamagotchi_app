// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      tamagochi: json['tamagochi'] == null
          ? null
          : TamagochiDto.fromJson(json['tamagochi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tamagochi': instance.tamagochi,
    };
