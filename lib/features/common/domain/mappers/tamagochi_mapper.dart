import 'package:tamagochi_app/api/data/tamagochi_dto/tamagochi_dto.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';

/// Converts [TamagochiDto] to [Tamagochi]
Tamagochi toTamagochi(TamagochiDto object) {
  return Tamagochi(
    sleep: object.sleep ?? 0,
    health: object.health ?? 0,
    game: object.game ?? 0,
    food: object.food ?? 0,
    userId: object.user_id ?? -1,
    id: object.id ?? -1,
    generalState: object.general_state ?? 0,
  );
}

/// Converts [Tamagochi] to [TamagochiDto]
TamagochiDto toTamgochiDto(Tamagochi object) {
  return TamagochiDto(
    sleep: object.sleep,
    health: object.health,
    game: object.game,
    food: object.food,
    user_id: object.userId,
    id: object.id,
    general_state: object.generalState,
  );
}
