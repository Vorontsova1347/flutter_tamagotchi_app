// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tamagochi_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TamagochiDto _$TamagochiDtoFromJson(Map<String, dynamic> json) => TamagochiDto(
      sleep: (json['sleep'] as num).toDouble(),
      health: (json['health'] as num).toDouble(),
      game: (json['game'] as num).toDouble(),
      food: (json['food'] as num).toDouble(),
      user_id: json['user_id'] as int,
      id: json['id'] as int,
      general_state: (json['general_state'] as num).toDouble(),
    );

Map<String, dynamic> _$TamagochiDtoToJson(TamagochiDto instance) =>
    <String, dynamic>{
      'sleep': instance.sleep,
      'health': instance.health,
      'game': instance.game,
      'food': instance.food,
      'user_id': instance.user_id,
      'id': instance.id,
      'general_state': instance.general_state,
    };
