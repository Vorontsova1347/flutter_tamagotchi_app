// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDataDto _$ImageDataDtoFromJson(Map<String, dynamic> json) => ImageDataDto(
      id: json['id'] as int,
      url: json['url'] as String,
      title: json['title'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$ImageDataDtoToJson(ImageDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'text': instance.text,
    };
