import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tamagochi_app/api/data/data/login/login_data.dart';
import 'package:tamagochi_app/api/data/data/password_update/password_update_data.dart';
import 'package:tamagochi_app/api/data/data/registration/registration_data.dart';
import 'package:tamagochi_app/api/data/dto/access/access_data_dto.dart';
import 'package:tamagochi_app/api/data/dto/image_data/image_data_dto.dart';
import 'package:tamagochi_app/api/data/dto/tamagochi/tamagochi_dto.dart';
import 'package:tamagochi_app/api/data/dto/user/user_dto.dart';
import 'package:tamagochi_app/api/data/load/image_data/image_data_load.dart';
import 'package:tamagochi_app/api/data/load/tamagochi/tamagochi_load.dart';
import 'package:tamagochi_app/config/api_urls.dart';

part 'tamagochi_api_client.g.dart';

/// Клиент для взаимодействия с TamagochiApi
@RestApi()
abstract class TamagochiApiClient {
  factory TamagochiApiClient(Dio dio, {String baseUrl}) = _TamagochiApiClient;

  // Пользователь:

  @GET(ApiUrls.userGetList)
  Future<List<UserDto>> userGetList();

  @POST(ApiUrls.userPostLogin)
  Future<AccessDataDto> userLogin(
    @Body() LoginData loginData,
  );

  @POST(ApiUrls.userPostRegistration)
  Future<HttpResponse> userRegister(
    @Body() RegistrationData registrationData,
  );
  @POST(ApiUrls.userPostPassword)
  Future<HttpResponse> userUpdatePassword(
    @Header('Authorization') String authorization,
    @Body() PasswordUpdateData passwordUpdateData,
  );

  @GET(ApiUrls.userGetById)
  Future<UserDto> userGetById(
    @Path('user_id') int id,
    @Header('Authorization') String authorization,
  );

  @DELETE(ApiUrls.userDeleteById)
  Future<UserDto> adminUserDeleteById(
    @Path('user_id') int id,
    @Header('Authorization') String authorization,
  );

  // Тамагочи:

  @PUT(ApiUrls.tamagochiPut)
  Future<TamagochiDto> adminTamagochiUpdateById(
    @Path('user_id') int id,
    @Header('Authorization') String authorization,
    @Body() TamagochiLoad tamagochiLoad,
  );

  @POST(ApiUrls.tamagochiPostFood)
  Future<TamagochiDto> tamagochiFood(
    @Header('Authorization') String authorization,
  );

  @POST(ApiUrls.tamagochiPostGame)
  Future<TamagochiDto> tamagochiGame(
    @Header('Authorization') String authorization,
  );

  @POST(ApiUrls.tamagochiPostHealth)
  Future<TamagochiDto> tamagochiHealth(
    @Header('Authorization') String authorization,
  );

  @POST(ApiUrls.tamagochiPostSleep)
  Future<TamagochiDto> tamagochiSleep(
    @Header('Authorization') String authorization,
  );

  // Картинки:

  @POST(ApiUrls.imagePost)
  Future<ImageDataDto> adminImagePost(
    @Header('Authorization') String authorization,
    @Body() ImageDataLoad imageLoad,
  );

  @GET(ApiUrls.imageGetList)
  Future<List<ImageDataDto>> imageGetList();

  @PUT(ApiUrls.imagePutById)
  Future<ImageDataDto> adminImageUpdateById(
    @Path('image_id') int id,
    @Header('Authorization') String authorization,
    @Body() ImageDataLoad imageLoad,
  );

  @GET(ApiUrls.imageGetById)
  Future<ImageDataDto> adminImageGetById(
    @Path('image_id') int id,
    @Header('Authorization') String authorization,
  );

  @DELETE(ApiUrls.imageDeleteById)
  Future<ImageDataDto> adminImageDeleteById(
    @Path('image_id') int id,
    @Header('Authorization') String authorization,
  );
}
