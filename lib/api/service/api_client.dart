import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tamagochi_app/api/data/login_data/login_data.dart';
import 'package:tamagochi_app/api/data/registration_data/registration_data.dart';
import 'package:tamagochi_app/api/data/tamagochi_dto/tamagochi_dto.dart';
import 'package:tamagochi_app/api/data/tamagochi_load/tamagochi_load.dart';
import 'package:tamagochi_app/api/data/user_dto/user_dto.dart';
import 'package:tamagochi_app/config/api_urls.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // User Side:

  @POST(ApiUrls.userLogin)
  Future<HttpResponse> tryToLogin(
    @Body() LoginData loginData,
  );

  @POST(ApiUrls.userRegistration)
  Future<HttpResponse> tryToRegister(
    @Body() RegistrationData registrationData,
  );

  @GET(ApiUrls.userGetById)
  Future<UserDto> getUser(
    @Path('user_id') int id,
    @Header('Authorization') String authorization,
  );

  @DELETE(ApiUrls.userGetById)
  Future<UserDto> deleteUser(
    @Path('user_id') int id,
    @Header('Authorization') String authorization,
  );

  // Tamagochi Side:

  @PUT(ApiUrls.tamagochi)
  Future<TamagochiDto> putTamagochi(
    @Path('user_id') int id,
    @Header('Authorization') String authorization,
    @Body() TamagochiLoad tamagochiLoad,
  );

  @POST(ApiUrls.tamagochiFood)
  Future<TamagochiDto> foodTamagochi(
    @Header('Authorization') String authorization,
  );

  @POST(ApiUrls.tamagochiGame)
  Future<TamagochiDto> gameTamagochi(
    @Header('Authorization') String authorization,
  );

  @POST(ApiUrls.tamagochiHealth)
  Future<TamagochiDto> healthTamagochi(
    @Header('Authorization') String authorization,
  );

  @POST(ApiUrls.tamagochiSleep)
  Future<TamagochiDto> sleepTamagochi(
    @Header('Authorization') String authorization,
  );
}
