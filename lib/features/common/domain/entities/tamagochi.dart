/// Сущность тамагочи
class Tamagochi {
  final double sleep;
  final double health;
  final double game;
  final double food;
  final String name;
  final String gender;
  final int userId;
  final int id;
  final double generalState;

  Tamagochi({
    required this.gender,
    required this.name,
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
    return 'Tamagochi: {\n sleep: $sleep,\n health: $health,\n game: $game,\n food: $food,\n sleep: $sleep,\n gender: $gender,\n name: $name,\n user_id: $userId,\n id: $id,\n general_state: $generalState,\n}';
  }
}
