import 'package:tamagochi_app/api/service/tamagochi_api/tamagochi_api_client.dart';

/// Параметры для задания методов в [TamagochiApiClient]
//. put - обновляет существующие данные
/// post - добавляет новые данные
/// delete - удаляет данные
/// get - получает данные
class ApiUrls {
  // Пользователь:
  static const String userBase = '/user';

  static const String userGetList = userBase;
  static const String userPostRegistration = '$userBase/registration';
  static const String userPostPassword = '$userBase/update_password';
  static const String userPostLogin = '$userBase/login';
  static const String userGetById = '$userBase/{user_id}';
  static const String userDeleteById = '$userBase/{user_id}';

  // Тамагочи:
  static const String tamagochiBase = '/tamagochi';

  static const String tamagochiPut = tamagochiBase;
  static const String tamagochiPostFood = '$tamagochiBase/food';
  static const String tamagochiPostGame = '$tamagochiBase/game';
  static const String tamagochiPostHealth = '$tamagochiBase/health';
  static const String tamagochiPostSleep = '$tamagochiBase/sleep';

  // Картинки:
  static const String imageBase = '/image_data';

  static const String imageGetList = imageBase;
  static const String imagePost = imageBase;
  static const String imagePutById = '$imageBase/{image_id}';
  static const String imageGetById = '$imageBase/{image_id}';
  static const String imageDeleteById = '$imageBase/{image_id}';

  static const String defautlDioUrl =
      'https://tamagotchi-backend.herokuapp.com';
}
