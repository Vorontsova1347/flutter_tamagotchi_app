import 'package:tamagochi_app/api/service/api_client.dart';

/// Options to configure [ApiClient] methods
class ApiUrls {
  static const String user = '/user';
  static const String userRegistration = '$user/registration';
  static const String userLogin = '$user/login';
  static const String userGetById = '$user/{user_id}';
  static const String userdeleteUserById = '$user/{user_id}';

  static const String tamagochi = '/tamagochi';
  static const String tamagochiFood = '$tamagochi/food';
  static const String tamagochiGame = '$tamagochi/game';
  static const String tamagochiHealth = '$tamagochi/health';
  static const String tamagochiSleep = '$tamagochi/sleep';

  static const String defautlDioUrl =
      'https://tamagotchi-backend.herokuapp.com';
}
