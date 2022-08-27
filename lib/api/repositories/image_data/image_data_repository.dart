import 'package:tamagochi_app/api/data/dto/image_data/image_data_dto.dart';
import 'package:tamagochi_app/api/service/tamagochi_api/tamagochi_api_client.dart';
import 'package:tamagochi_app/config/api_urls.dart';

import '../../../features/common/domain/entities/access_data.dart';

/// Репозиторий под [TamagochiApiClient] для взаимодействия с запросами картинок
class ImageDataRepository {
  final TamagochiApiClient apiClient;
  final AccessData accessData;

  ImageDataRepository({required this.apiClient, required this.accessData});

  String generateLinkOnNews(int id) =>
      Uri.https(ApiUrls.defautlDioUrl, '${ApiUrls.imageBase}/$id').toString();

  Future<List<ImageDataDto>> imageGetList() {
    return apiClient.imageGetList();
  }

  Future<ImageDataDto> imageGetById(int id) {
    return apiClient.adminImageGetById(id, accessData.accessToken ?? '');
  }
}
