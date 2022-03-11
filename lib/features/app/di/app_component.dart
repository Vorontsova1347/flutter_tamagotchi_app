import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:surf_injector/surf_injector.dart';
import 'package:tamagochi_app/api/data/access_data/access_data.dart';
import 'package:tamagochi_app/api/service/api_client.dart';
import 'package:tamagochi_app/config/api_urls.dart';
import 'package:tamagochi_app/config/dio_options.dart';
import 'package:tamagochi_app/features/common/domain/interactors/user/user_interactor.dart';
import 'package:tamagochi_app/features/common/domain/repository/user/user_repository.dart';

/// DI [Component] for app
class AppComponent extends Component {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final navigator = GlobalKey<NavigatorState>();
  final accessToken = AccessData();

  late final userRepository = UserRepository(
    client: _apiClient,
    accessData: accessToken,
  );
  late final userInteractor = UserInteractor(userRepository);
  late final _dio = Dio(dioOptions);
  late final _apiClient = ApiClient(_dio, baseUrl: ApiUrls.defautlDioUrl);
}
