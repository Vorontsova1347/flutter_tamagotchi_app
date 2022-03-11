import 'package:tamagochi_app/api/data/user_dto/user_dto.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';
import 'package:tamagochi_app/features/common/domain/entities/user.dart';
import 'package:tamagochi_app/features/common/domain/mappers/tamagochi_mapper.dart';

/// Converts [UserDto] to [User]
User toUser(UserDto object) {
  return User(
    id: object.id ?? -1,
    name: object.name ?? 'unnamed',
    tamagochi: object.tamagochi == null
        ? Tamagochi(
            sleep: -1,
            health: -1,
            game: -1,
            food: -1,
            userId: -1,
            id: -1,
            generalState: -1,
          )
        : toTamagochi(object.tamagochi!),
  );
}

/// Converts [User] to [UserDto]
UserDto toUserDto(User object) {
  return UserDto(
    id: object.id,
    name: object.name,
    tamagochi: toTamgochiDto(object.tamagochi),
  );
}
