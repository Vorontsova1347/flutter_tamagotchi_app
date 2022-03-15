// ignore_for_file: member-ordering-extended

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/api/repositories/image_data/image_data_repository.dart';
import 'package:tamagochi_app/api/repositories/tamagochi/tamagochi_repository.dart';
import 'package:tamagochi_app/api/repositories/user/user_repository.dart';
import 'package:tamagochi_app/api/service/tamagochi_api/tamagochi_api_client.dart';
import 'package:tamagochi_app/config/api_urls.dart';
import 'package:tamagochi_app/config/dio_options.dart';
import 'package:tamagochi_app/features/common/domain/entities/access_data.dart';
import 'package:tamagochi_app/features/common/domain/interactors/image_data/image_data_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/tamagochi/tamagochi_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';

/// [Component] с зависимостями, которые будут жить на протяжении всего цикла приложения
class AppComponent extends Component {
  // Навигация и состояние:
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final navigator = GlobalKey<NavigatorState>();

  // Важные данные:
  final _accessData = AccessData();

  // API:
  late final _dio = Dio(dioOptions);
  late final _apiClient = TamagochiApiClient(
    _dio,
    baseUrl: ApiUrls.defautlDioUrl,
  );

  // Репозитории:
  late final userRepository = UserRepository(
    client: _apiClient,
    accessData: _accessData,
  );
  late final imageDataRepository = ImageDataRepository(
    apiClient: _apiClient,
  );
  late final tamagochiRepository = TamagochiRepository(
    accessData: _accessData,
    client: _apiClient,
  );

  // Интеракторы:
  late final tamagochiInteractor = TamagochiInteractor(
    tamagochiRepository: tamagochiRepository,
    accessData: _accessData,
  );
  late final userInteractor = UserInteractor(
    accessData: _accessData,
    userRepository: userRepository,
  );
  late final imageDataInteractor = ImageDataInteractor(
    imageDataRepository: imageDataRepository,
  );
}
