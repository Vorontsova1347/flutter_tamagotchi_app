import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamagochi_app/api/data/access_data_dto/access_data_dto.dart';
import 'package:tamagochi_app/api/data/login_data/login_data.dart';
import 'package:tamagochi_app/api/data/password_data/password_data.dart';
import 'package:tamagochi_app/api/data/registration_data/registration_data.dart';
import 'package:tamagochi_app/api/data/user_dto/user_dto.dart';
import 'package:tamagochi_app/api/service/api_client.dart';
import 'package:tamagochi_app/api/util/dio_error_extension.dart';
import 'package:tamagochi_app/features/common/domain/entities/access_data.dart';

/// Repository for User side of [ApiClient]
class UserRepository {
  final ApiClient client;
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
    required PasswordData passwordData,
    required String accessToken,
  }) async {
    try {
      await client.userUpdatePassword(
        'Bearer $accessToken',
        passwordData,
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
