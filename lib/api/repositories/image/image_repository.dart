import 'package:tamagochi_app/api/data/image_dto/image_dto.dart';
import 'package:tamagochi_app/api/service/api_client.dart';

class ImageRepository {
  final ApiClient apiClient;

  ImageRepository({required this.apiClient});

  Future<List<ImageDto>> imageGetList(){
    return apiClient.imageGetList();
  }
}
