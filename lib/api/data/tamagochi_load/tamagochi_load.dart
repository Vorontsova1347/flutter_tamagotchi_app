import 'package:json_annotation/json_annotation.dart';
part 'tamagochi_load.g.dart';

@JsonSerializable()
class TamagochiLoad {
  final double? sleep;
  final double? health;
  final double? game;
  final double? food;

  TamagochiLoad(
    this.sleep,
    this.health,
    this.game,
    this.food,
  );

  factory TamagochiLoad.fromJson(Map<String, dynamic> json) =>
      _$TamagochiLoadFromJson(json);

  Map<String, dynamic> toJson() => _$TamagochiLoadToJson(this);
}
