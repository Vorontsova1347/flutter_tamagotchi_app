import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamagochi_app/api/data/access_data/access_data.dart';
import 'package:tamagochi_app/api/data/tamagochi_dto/tamagochi_dto.dart';
import 'package:tamagochi_app/api/data/tamagochi_load/tamagochi_load.dart';
import 'package:tamagochi_app/api/service/api_client.dart';
import 'package:tamagochi_app/api/util/dio_error_extension.dart';

/// Repository for Tamagochi side of [ApiClient]
class TamagochiRepository {
  final ApiClient client;
  final AccessData accessData;

  const TamagochiRepository({
    required this.client,
    required this.accessData,
  });

  Future<TamagochiDto?> updateTamagochiById(
    TamagochiLoad tamagochiLoad,
    int id,
  ) async {
    if (accessData.access_token == null) {
      throw Exception('AccesData is empty');
    }

    try {
      return client.putTamagochi(
        id,
        'Bearer ${accessData.access_token!}',
        tamagochiLoad,
      );
    } on DioError catch (e) {
      debugPrint(e.toDebugString());

      return null;
    }
  }

  Future<TamagochiDto> updateTamagochi(TamagochiLoad tamagochiLoad) async {
    if (accessData.access_token == null || accessData.id == null) {
      throw Exception('AccesData is empty');
    }

    return client.putTamagochi(
      accessData.id!,
      'Bearer ${accessData.access_token!}',
      tamagochiLoad,
    );
  }

  Future<TamagochiDto> foodTamagochi() async {
    if (accessData.access_token == null || accessData.id == null) {
      throw Exception('AccesData is empty');
    }

    return client.foodTamagochi(
      'Bearer ${accessData.access_token!}',
    );
  }

  Future<TamagochiDto> healthTamagochi() async {
    if (accessData.access_token == null || accessData.id == null) {
      throw Exception('AccesData is empty');
    }

    return client.healthTamagochi(
      'Bearer ${accessData.access_token!}',
    );
  }

  Future<TamagochiDto> gameTamagochi() async {
    if (accessData.access_token == null || accessData.id == null) {
      throw Exception('AccesData is empty');
    }

    return client.gameTamagochi(
      'Bearer ${accessData.access_token!}',
    );
  }

  Future<TamagochiDto> sleepTamagochi() async {
    if (accessData.access_token == null || accessData.id == null) {
      throw Exception('AccesData is empty');
    }

    return client.sleepTamagochi(
      'Bearer ${accessData.access_token!}',
    );
  }
}
