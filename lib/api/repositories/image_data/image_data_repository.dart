import 'package:tamagochi_app/api/data/dto/image_data/image_data_dto.dart';
import 'package:tamagochi_app/api/service/tamagochi_api/tamagochi_api_client.dart';

/// Репозиторий под [TamagochiApiClient] для взаимодействия с запросами картинок
class ImageDataRepository {
  final TamagochiApiClient apiClient;

  ImageDataRepository({required this.apiClient});

  Future<List<ImageDataDto>> imageGetList() {
    return apiClient.imageGetList();
  }
}
