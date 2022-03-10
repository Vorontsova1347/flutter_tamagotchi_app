import 'package:json_annotation/json_annotation.dart';
part 'tamagochi_dump.g.dart';

@JsonSerializable()
class TamagochiDump {
  final double? sleep;
  final double? health;
  final double? game;
  final double? food;
  final int? user_id;
  final int? id;
  final double? general_state;

  TamagochiDump(
    this.sleep,
    this.health,
    this.game,
    this.food,
    this.user_id,
    this.id,
    this.general_state,
  );

  factory TamagochiDump.fromJson(Map<String, dynamic> json) =>
      _$TamagochiDumpFromJson(json);

  Map<String, dynamic> toJson() => _$TamagochiDumpToJson(this);
}
