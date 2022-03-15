import 'package:dio/dio.dart';
import 'package:tamagochi_app/config/api_urls.dart';

/// Базовые параметры ([BaseOptions]) для инициализации [Dio]
BaseOptions dioOptions = BaseOptions(
  baseUrl: ApiUrls.defautlDioUrl,
  connectTimeout: 30000,
  receiveTimeout: 120000,
);
