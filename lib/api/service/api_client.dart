import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tamagochi_app/api/data/access_data_dto/access_data_dto.dart';
import 'package:tamagochi_app/api/data/image_dto/image_dto.dart';
import 'package:tamagochi_app/api/data/image_load/image_load.dart';
import 'package:tamagochi_app/api/data/login_data/login_data.dart';
import 'package:tamagochi_app/api/data/password_data/password_data.dart';
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
    @Body() PasswordData passwordData,
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

  // Tamagochi Side:

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

  // ImageData

  @POST(ApiUrls.imagePost)
  Future<ImageDto> adminImagePost(
    @Header('Authorization') String authorization,
    @Body() ImageLoad imageLoad,
  );

  @GET(ApiUrls.imageGetList)
  Future<List<ImageDto>> imageGetList();

  @PUT(ApiUrls.imagePutById)
  Future<ImageDto> adminImageUpdateById(
    @Path('image_id') int id,
    @Header('Authorization') String authorization,
    @Body() ImageLoad imageLoad,
  );

  @GET(ApiUrls.imageGetById)
  Future<ImageDto> adminImageGetById(
    @Path('image_id') int id,
    @Header('Authorization') String authorization,
  );

  @DELETE(ApiUrls.imageDeleteById)
  Future<ImageDto> adminImageDeleteById(
    @Path('image_id') int id,
    @Header('Authorization') String authorization,
  );
}
