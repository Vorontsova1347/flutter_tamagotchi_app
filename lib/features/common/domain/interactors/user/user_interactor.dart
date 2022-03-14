import 'package:tamagochi_app/api/data/login_data/login_data.dart';
import 'package:tamagochi_app/api/data/password_data/password_data.dart';
import 'package:tamagochi_app/api/data/registration_data/registration_data.dart';
import 'package:tamagochi_app/api/repositories/user/user_repository.dart';
import 'package:tamagochi_app/features/common/domain/entities/access_data.dart';
import 'package:tamagochi_app/features/common/domain/entities/user.dart';
import 'package:tamagochi_app/features/common/domain/mappers/user_mapper.dart';

/// Interactor for [UserRepository]
class UserInteractor {
  final UserRepository userRepository;
  final AccessData accessData;

  UserInteractor({
    required this.userRepository,
    required this.accessData,
  });

  void logout() {
    accessData.clean();
  }

  Future<bool> login({
    required LoginData loginData,
  }) async {
    return userRepository.userLogin(loginData);
  }

  Future<bool> register(RegistrationData registrationData) async {
    return userRepository.userRegister(registrationData: registrationData);
  }

  Future<User> getData() async {
    _assertHasAcessData();

    final response = await userRepository.userGetById(
      id: accessData.userId!,
      accessToken: accessData.accessToken!,
    );

    return toUser(
      response!,
    );
  }

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    _assertHasAcessData();

    return userRepository.userUpdatePassword(
      passwordData:
          PasswordData(new_password: newPassword, old_password: oldPassword),
      accessToken: accessData.accessToken!,
    );
  }

  void _assertHasAcessData() {
    if (!accessData.isInitialized()) {
      throw Exception('AccessData is not initalizezd');
    }
  }
}
