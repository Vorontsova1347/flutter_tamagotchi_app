import 'package:tamagochi_app/api/data/user_dto/user_dto.dart';
import 'package:tamagochi_app/features/common/domain/entities/tamagochi.dart';
import 'package:tamagochi_app/features/common/domain/entities/user.dart';
import 'package:tamagochi_app/features/common/domain/mappers/tamagochi_mapper.dart';

/// Converts [UserDto] to [User]
User toUser(UserDto object) {
  return User(
    id: object.id ?? -1,
    login: object.login ?? 'nologin',
    tamagochi: object.tamagochi == null
        ? Tamagochi(
            sleep: 0,
            health: 0,
            game: 0,
            food: 0,
            userId: object.id ?? -1,
            gender: 'neutral',
            name: 'noname',
            id: -1,
            generalState: 0,
          )
        : toTamagochi(object.tamagochi!),
  );
}

/// Converts [User] to [UserDto]
UserDto toUserDto(User object) {
  return UserDto(
    id: object.id,
    login: object.login,
    tamagochi: toTamgochiDto(object.tamagochi),
  );
}
