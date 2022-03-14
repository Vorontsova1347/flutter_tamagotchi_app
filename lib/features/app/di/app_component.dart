import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/api/repositories/tamagochi/tamagochi_repository.dart';
import 'package:tamagochi_app/api/repositories/user/user_repository.dart';
import 'package:tamagochi_app/api/service/api_client.dart';
import 'package:tamagochi_app/config/api_urls.dart';
import 'package:tamagochi_app/config/dio_options.dart';
import 'package:tamagochi_app/features/common/domain/entities/access_data.dart';
import 'package:tamagochi_app/features/common/domain/interactors/tamagochi/tamagochi_interactor.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';

/// DI [Component] for app
class AppComponent extends Component {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final navigator = GlobalKey<NavigatorState>();

  late final userRepository = UserRepository(
    client: _apiClient,
    accessData: _accessData,
  );
  late final tamagochiRepository = TamagochiRepository(
    accessData: _accessData,
    client: _apiClient,
  );
  late final tamagochiInteractor = TamagochiInteractor(
    tamagochiRepository: tamagochiRepository,
    accessData: _accessData,
  );
  late final userInteractor = UserInteractor(
    accessData: _accessData,
    userRepository: userRepository,
  );

  final _accessData = AccessData();
  late final _dio = Dio(dioOptions);
  late final _apiClient = ApiClient(_dio, baseUrl: ApiUrls.defautlDioUrl);
}
