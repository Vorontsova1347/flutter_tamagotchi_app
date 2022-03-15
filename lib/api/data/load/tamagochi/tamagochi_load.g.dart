// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tamagochi_load.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TamagochiLoad _$TamagochiLoadFromJson(Map<String, dynamic> json) =>
    TamagochiLoad(
      sleep: (json['sleep'] as num?)?.toDouble(),
      health: (json['health'] as num?)?.toDouble(),
      game: (json['game'] as num?)?.toDouble(),
      food: (json['food'] as num?)?.toDouble(),
      name: json['name'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$TamagochiLoadToJson(TamagochiLoad instance) =>
    <String, dynamic>{
      'sleep': instance.sleep,
      'health': instance.health,
      'game': instance.game,
      'food': instance.food,
      'name': instance.name,
      'gender': instance.gender,
    };
