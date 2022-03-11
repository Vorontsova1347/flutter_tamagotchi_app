import 'package:dio/dio.dart';

/// Extension to get [String] with information about [DioError] instance
extension CustomToString on DioError {
  String toDebugString() {
    return 'DioError: {\n error: ${error.toString()}},\n response: ${response.toString()},\n type: ${type.toString()}\n }';
  }
}
