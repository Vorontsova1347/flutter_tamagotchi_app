import 'package:dio/dio.dart';

/// Расширение для получения строки с информацией о сущности [DioError]
extension CustomToString on DioError {
  String toDebugString() {
    return 'DioError: {\n error: ${error.toString()}},\n response: ${response.toString()},\n type: ${type.toString()}\n }';
  }
}
