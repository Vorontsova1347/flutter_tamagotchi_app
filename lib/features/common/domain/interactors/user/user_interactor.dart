import 'package:tamagochi_app/api/data/login_data/login_data.dart';
import 'package:tamagochi_app/api/data/user_dto/user_dto.dart';
import 'package:tamagochi_app/features/common/domain/entities/user.dart';
import 'package:tamagochi_app/features/common/domain/mappers/user_mapper.dart';
import 'package:tamagochi_app/features/common/domain/repository/user/user_repository.dart';
import 'package:tuple/tuple.dart';

/// Interactor for [UserRepository]
class UserInteractor {
  final UserRepository _userRepository;

  UserInteractor(this._userRepository);

  /// Tries to login, using [LoginData]
  /// returns true if success, otherwise false
  Future<bool> tryToLogin({
    required String login,
    required String password,
  }) async {
    return _userRepository.tryToLogin(
      LoginData(
        name: login,
        password: password,
      ),
    );
  }

  /// Tries to get current [User]
  /// always returns [User] (method could be call only after success result of [tryToLogin])
  Future<User> getUser() async {
    return toUser(await _userRepository.getUserDto());
  }

  /// Tries to delete current [User]
  Future<Tuple2<bool, User>> deleteUser() async {
    return Tuple2(
      true,
      toUser(
        await _userRepository.deleteUserDto(),
      ),
    );
  }

  /// Tries to delete [User] by [id]
  Future<Tuple2<bool, User?>> deleteUserById(int id) async {
    final response = await _userRepository.deleteUserById(id);

    return response == null
        ? Tuple2(false, toUser(UserDto()))
        : Tuple2(true, toUser(response));
  }

  /// Tries to get [User] by [id]
  Future<Tuple2<bool, User?>> getUserById(int id) async {
    final response = await _userRepository.getUserById(id);

    return response == null
        ? Tuple2(false, toUser(UserDto()))
        : Tuple2(true, toUser(response));
  }
}
