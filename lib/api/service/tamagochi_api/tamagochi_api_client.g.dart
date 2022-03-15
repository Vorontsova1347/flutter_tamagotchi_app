// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tamagochi_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _TamagochiApiClient implements TamagochiApiClient {
  _TamagochiApiClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<UserDto>> userGetList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<UserDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => UserDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<AccessDataDto> userLogin(loginData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AccessDataDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AccessDataDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> userRegister(registrationData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registrationData.toJson());
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/registration',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> userUpdatePassword(
      authorization, passwordUpdateData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(passwordUpdateData.toJson());
    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/update_password',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<UserDto> userGetById(id, authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserDto> adminUserDeleteById(id, authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserDto>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TamagochiDto> adminTamagochiUpdateById(
      id, authorization, tamagochiLoad) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(tamagochiLoad.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TamagochiDto>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tamagochi',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TamagochiDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TamagochiDto> tamagochiFood(authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TamagochiDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tamagochi/food',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TamagochiDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TamagochiDto> tamagochiGame(authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TamagochiDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tamagochi/game',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TamagochiDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TamagochiDto> tamagochiHealth(authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TamagochiDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tamagochi/health',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TamagochiDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TamagochiDto> tamagochiSleep(authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TamagochiDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tamagochi/sleep',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TamagochiDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ImageDataDto> adminImagePost(authorization, imageLoad) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(imageLoad.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImageDataDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/image_data',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageDataDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<ImageDataDto>> imageGetList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ImageDataDto>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/image_data',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ImageDataDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ImageDataDto> adminImageUpdateById(
      id, authorization, imageLoad) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(imageLoad.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImageDataDto>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, '/image_data/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageDataDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ImageDataDto> adminImageGetById(id, authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImageDataDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/image_data/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageDataDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ImageDataDto> adminImageDeleteById(id, authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImageDataDto>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, '/image_data/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageDataDto.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
