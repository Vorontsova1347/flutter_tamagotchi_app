import 'package:tamagochi_app/api/repositories/image_data/image_data_repository.dart';
import 'package:tamagochi_app/features/common/domain/entities/image_data.dart';
import 'package:tamagochi_app/features/common/domain/mappers/image_mapper.dart';

/// Интерактор для [ImageDataRepository]
class ImageDataInteractor {
  final ImageDataRepository imageDataRepository;

  ImageDataInteractor({required this.imageDataRepository});

  String generateLinkOnNews(int id) => imageDataRepository.generateLinkOnNews(id);

  Future<List<ImageData>> getAllImages() async {
    return (await imageDataRepository.imageGetList()).map(toImageData).toList();
  }

  Future<ImageData> getImageById(int id) async {
    return toImageData(await imageDataRepository.imageGetById(id));
  }
}
