import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamagochi_app/api/data/access_data/access_data.dart';
import 'package:tamagochi_app/api/data/login_data/login_data.dart';
import 'package:tamagochi_app/api/data/registration_data/registration_data.dart';
import 'package:tamagochi_app/api/data/tamagochi_dto/tamagochi_dto.dart';
import 'package:tamagochi_app/api/data/user_dto/user_dto.dart';
import 'package:tamagochi_app/api/service/api_client.dart';
import 'package:tamagochi_app/api/util/dio_error_extension.dart';

/// Repository for User side of [ApiClient]
class UserRepository {
  final ApiClient client;
  final AccessData accessData;

  const UserRepository({
    required this.client,
    required this.accessData,
  });

  /// Login method
  /// description: Tries to login. If success -> reponse returns 200 code & access_token & id,
  /// while method returns True. Otherwise falls with 400 code and method returns false
  Future<bool> tryToLogin(LoginData loginData) async {
    try {
      final response =
          (await client.tryToLogin(loginData)).data as Map<String, dynamic>;
      final accessResponse = AccessData.fromJson(response);
      accessData
        ..id = accessResponse.id
        ..access_token = accessResponse.access_token;
      debugPrint(accessData.toString());

      return true;
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return false;
    }
  }

  /// Register method
  /// description: Tries to Register. If success -> reponse returns 200 code,
  /// while method returns True. Otherwise falls with 400 code and method returns false
  Future<bool> tryToRegister(RegistrationData registrationData) async {
    try {
      await client.tryToRegister(registrationData);

      debugPrint(accessData.toString());

      return true;
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return false;
    }
  }

  /// Get [UserDto] of current user. using [AccessData]
  /// description: Tries to get [UserDto]. Returns current user
  Future<UserDto> getUserDto() async {
    if (accessData.access_token == null || accessData.id == null) {
      throw Exception('AccesData is empty');
    }

    final userData = await client.getUser(
      accessData.id!,
      'Bearer ${accessData.access_token!}',
    );
    if (userData.tamagochi.isEmpty) {
      userData.tamagochi = [];
    }
  }

  /// Get [UserDto] by id. using [AccessData.access_token] and [id]
  /// description: Tries to get [UserDto] with [id], using (if it exists) admin rights, connected
  /// to [AccessData.access_token]. If success -> returns Returns [UserDto], otherwise
  /// returns different codes with null value on method
  Future<UserDto?> getUserById(int id) async {
    if (accessData.access_token == null) {
      throw Exception('AccesData is empty');
    }

    try {
      return client.getUser(
        id,
        'Bearer ${accessData.access_token!}',
      );
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return null;
    }
  }

  /// Delete [UserDto] by id. using [AccessData.access_token] and [id]
  /// description: Tries to delete [UserDto] with [id], using (if it exists) admin rights, connected
  /// to [AccessData.access_token]. If success -> returns Returns [UserDto] before delete, otherwise
  /// returns different codes with null value on method
  Future<UserDto?> deleteUserById(int id) async {
    if (accessData.access_token == null) {
      throw Exception('AccesData is empty');
    }

    try {
      return client.deleteUser(
        id,
        'Bearer ${accessData.access_token!}',
      );
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return null;
    }
  }

  /// Delete [UserDto] of current user. using [AccessData]
  /// description: Tries to Delete [UserDto]. Returns current [UserDto] before delete
  Future<UserDto> deleteUserDto() async {
    if (accessData.access_token == null || accessData.id == null) {
      throw Exception('AccesData is empty');
    }

    return client.deleteUser(
      accessData.id!,
      'Bearer ${accessData.access_token!}',
    );
  }
}
