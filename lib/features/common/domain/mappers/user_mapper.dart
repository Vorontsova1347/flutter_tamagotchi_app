import 'package:tamagochi_app/api/data/user_dto/user_dto.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';
import 'package:tamagochi_app/features/common/domain/entities/user.dart';
import 'package:tamagochi_app/features/common/domain/mappers/tamagochi_mapper.dart';

/// Converts [UserDto] to [User]
User toUser(UserDto object, int user_id) {
  return User(
    id: object.id ?? -1,
    name: object.name ?? 'unnamed',
    tamagochi: object.tamagochi == null
        ? Tamagochi(
            sleep: 0,
            health: 0,
            game: 0,
            food: 0,
            userId: user_id,
            id: 0,
            generalState: 0,
          )
        : toTamagochi(object.tamagochi![0]!),
  );
}

/// Converts [User] to [UserDto]
UserDto toUserDto(User object) {
  return UserDto(
    id: object.id,
    name: object.name,
    tamagochi: [toTamgochiDto(object.tamagochi)],
  );
}
