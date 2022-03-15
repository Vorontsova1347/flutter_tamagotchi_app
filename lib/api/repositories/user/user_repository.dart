import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamagochi_app/api/data/data/login/login_data.dart';
import 'package:tamagochi_app/api/data/data/password_update/password_update_data.dart';
import 'package:tamagochi_app/api/data/data/registration/registration_data.dart';
import 'package:tamagochi_app/api/data/dto/user/user_dto.dart';
import 'package:tamagochi_app/api/service/tamagochi_api/tamagochi_api_client.dart';
import 'package:tamagochi_app/api/util/dio_extensions/custom_to_string.dart';
import 'package:tamagochi_app/features/common/domain/entities/access_data.dart';

/// Репозиторий под [TamagochiApiClient] для взаимодействия с запросами пользователя
class UserRepository {
  final TamagochiApiClient client;
  final AccessData accessData;

  const UserRepository({
    required this.client,
    required this.accessData,
  });

  Future<bool> userLogin(LoginData loginData) async {
    try {
      final accessResponse = await client.userLogin(loginData);
      accessData.initialize(
        acessToken: accessResponse.access_token!,
        userId: accessResponse.id!,
      );
      if (accessData.isInitialized()) {
        return true;
      }

      return false;
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return false;
    }
  }

  Future<bool> userRegister({
    required RegistrationData registrationData,
  }) async {
    try {
      await client.userRegister(registrationData);

      return true;
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return false;
    }
  }

  Future<bool> userUpdatePassword({
    required PasswordUpdateData passwordUpdateData,
    required String accessToken,
  }) async {
    try {
      await client.userUpdatePassword(
        'Bearer $accessToken',
        passwordUpdateData,
      );

      return true;
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return false;
    }
  }

  Future<UserDto?> userGetById({
    required int id,
    required String accessToken,
  }) async {
    try {
      return client.userGetById(
        id,
        'Bearer $accessToken',
      );
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return null;
    }
  }

  Future<UserDto?> adminUserDeleteById({
    required int id,
    required String accessToken,
  }) async {
    try {
      return client.adminUserDeleteById(
        id,
        'Bearer $accessToken',
      );
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return null;
    }
  }
}
