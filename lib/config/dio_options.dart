import 'package:dio/dio.dart';
import 'package:tamagochi_app/config/api_urls.dart';

/// [BaseOptions] to init [Dio]
BaseOptions dioOptions = BaseOptions(
  baseUrl: ApiUrls.defautlDioUrl,
  connectTimeout: 30000,
  receiveTimeout: 120000,
);
