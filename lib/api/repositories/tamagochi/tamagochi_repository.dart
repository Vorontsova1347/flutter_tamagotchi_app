import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamagochi_app/api/data/dto/tamagochi/tamagochi_dto.dart';
import 'package:tamagochi_app/api/data/load/tamagochi/tamagochi_load.dart';
import 'package:tamagochi_app/api/service/tamagochi_api/tamagochi_api_client.dart';
import 'package:tamagochi_app/api/util/dio_extensions/custom_to_string.dart';
import 'package:tamagochi_app/features/common/domain/entities/access_data.dart';

/// Репозиторий под [TamagochiApiClient] для взаимодействия с запросами тамагочи 
class TamagochiRepository {
  final TamagochiApiClient client;
  final AccessData accessData;

  const TamagochiRepository({
    required this.client,
    required this.accessData,
  });

  Future<TamagochiDto?> adminTamagochiUpdateById({
    required TamagochiLoad tamagochiLoad,
    required String accessToken,
    required int id,
  }) async {
    try {
      return client.adminTamagochiUpdateById(
        id,
        'Bearer $accessToken',
        tamagochiLoad,
      );
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return null;
    }
  }

  Future<TamagochiDto> tamagochiFood({required String accessToken}) async {
    return client.tamagochiFood(
      'Bearer $accessToken',
    );
  }

  Future<TamagochiDto> tamagochiHealth({required String accessToken}) async {
    return client.tamagochiHealth(
      'Bearer $accessToken',
    );
  }

  Future<TamagochiDto> tamagochiGame({required String accessToken}) async {
    return client.tamagochiGame(
      'Bearer $accessToken',
    );
  }

  Future<TamagochiDto> tamagochiSleep({required String accessToken}) async {
    return client.tamagochiSleep(
      'Bearer $accessToken',
    );
  }
}
