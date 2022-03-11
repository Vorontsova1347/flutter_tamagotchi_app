import 'package:json_annotation/json_annotation.dart';
part 'tamagochi_load.g.dart';

@JsonSerializable()
class TamagochiLoad {
  final double sleep;
  final double health;
  final double game;
  final double food;

  TamagochiLoad({
    required this.sleep,
    required this.health,
    required this.game,
    required this.food,
  });

  factory TamagochiLoad.fromJson(Map<String, dynamic> json) =>
      _$TamagochiLoadFromJson(json);

  @override
  String toString() {
    return 'TamagochiLoad: {\n sleep: $sleep,\n health: $health,\n game: $game,\n food: $food,\n}';
  }

  Map<String, dynamic> toJson() => _$TamagochiLoadToJson(this);
}
