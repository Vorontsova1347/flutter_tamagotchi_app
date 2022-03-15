// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessDataDto _$AccessDataDtoFromJson(Map<String, dynamic> json) =>
    AccessDataDto(
      access_token: json['access_token'] as String? ?? null,
      id: json['id'] as int? ?? null,
    );

Map<String, dynamic> _$AccessDataDtoToJson(AccessDataDto instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'id': instance.id,
    };
