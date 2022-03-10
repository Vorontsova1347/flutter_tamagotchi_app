// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tamagochi_dump.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TamagochiDump _$TamagochiDumpFromJson(Map<String, dynamic> json) {
  return TamagochiDump(
    (json['sleep'] as num?)?.toDouble(),
    (json['health'] as num?)?.toDouble(),
    (json['game'] as num?)?.toDouble(),
    (json['food'] as num?)?.toDouble(),
    json['user_id'] as int?,
    json['id'] as int?,
    (json['general_state'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$TamagochiDumpToJson(TamagochiDump instance) =>
    <String, dynamic>{
      'sleep': instance.sleep,
      'health': instance.health,
      'game': instance.game,
      'food': instance.food,
      'user_id': instance.user_id,
      'id': instance.id,
      'general_state': instance.general_state,
    };
