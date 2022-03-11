import 'package:tamagochi_app/api/data/tamagochi_dto/tamagochi_dto.dart';

/// [TamagochiDto] model
class Tamagochi {
  final double sleep;
  final double health;
  final double game;
  final double food;
  final int userId;
  final int id;
  final double generalState;

  Tamagochi({
    required this.sleep,
    required this.health,
    required this.game,
    required this.food,
    required this.userId,
    required this.id,
    required this.generalState,
  });

  @override
  String toString() {
    return 'Tamagochi: {\n sleep: $sleep,\n health: $health,\n game: $game,\n food: $food,\n sleep: $sleep,\n user_id: $userId,\n id: $id,\n general_state: $generalState,\n}';
  }
}
