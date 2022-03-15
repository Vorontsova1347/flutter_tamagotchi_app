import 'package:tamagochi_app/api/data/dto/tamagochi/tamagochi_dto.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';

/// Конвертирует [TamagochiDto] в [Tamagochi]
Tamagochi toTamagochi(TamagochiDto object) {
  return Tamagochi(
    sleep: object.sleep ?? 0,
    health: object.health ?? 0,
    game: object.game ?? 0,
    food: object.food ?? 0,
    userId: object.user_id ?? -1,
    id: object.id ?? -1,
    gender: object.gender ?? 'neutral',
    name: object.name ?? 'noname',
    generalState: object.general_state ?? 0,
  );
}

/// Конвертирует [Tamagochi] в [TamagochiDto]
TamagochiDto toTamgochiDto(Tamagochi object) {
  return TamagochiDto(
    sleep: object.sleep,
    health: object.health,
    game: object.game,
    food: object.food,
    user_id: object.userId,
    id: object.id,
    name: object.name,
    gender: object.gender,
    general_state: object.generalState,
  );
}
