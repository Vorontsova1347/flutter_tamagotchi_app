// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tamagochi_load.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TamagochiLoad _$TamagochiLoadFromJson(Map<String, dynamic> json) {
  return TamagochiLoad(
    (json['sleep'] as num?)?.toDouble(),
    (json['health'] as num?)?.toDouble(),
    (json['game'] as num?)?.toDouble(),
    (json['food'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$TamagochiLoadToJson(TamagochiLoad instance) =>
    <String, dynamic>{
      'sleep': instance.sleep,
      'health': instance.health,
      'game': instance.game,
      'food': instance.food,
    };
