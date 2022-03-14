import 'package:tamagochi_app/api/service/api_client.dart';

/// Options to configure [ApiClient] methods
/// put - updates existing data
/// post - add new data
/// delete - delete data
/// get - get data
///
class ApiUrls {
  static const String userBase = '/user';

  static const String userGetList = userBase;
  static const String userPostRegistration = '$userBase/registration';
  static const String userPostPassword = '$userBase/update_password';
  static const String userPostLogin = '$userBase/login';
  static const String userGetById = '$userBase/{user_id}';
  static const String userDeleteById = '$userBase/{user_id}';

  static const String tamagochiBase = '/tamagochi';

  static const String tamagochiPut = tamagochiBase;
  static const String tamagochiPostFood = '$tamagochiBase/food';
  static const String tamagochiPostGame = '$tamagochiBase/game';
  static const String tamagochiPostHealth = '$tamagochiBase/health';
  static const String tamagochiPostSleep = '$tamagochiBase/sleep';

  static const String imageBase = '/image_data';

  static const String imageGetList = imageBase;
  static const String imagePost = imageBase;
  static const String imagePutById = '$imageBase/{image_id}';
  static const String imageGetById = '$imageBase/{image_id}';
  static const String imageDeleteById = '$imageBase/{image_id}';

  static const String defautlDioUrl =
      'https://tamagotchi-backend.herokuapp.com';
}
