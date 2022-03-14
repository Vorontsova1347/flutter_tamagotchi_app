import 'package:tamagochi_app/api/repositories/image/image_repository.dart';
import 'package:tamagochi_app/features/common/domain/entities/image.dart';
import 'package:tamagochi_app/features/common/domain/mappers/image_mapper.dart';

class ImageInteractor {
  final ImageRepository imageRepository;

  ImageInteractor({required this.imageRepository});

  Future<List<Image>> getAllImages() async {
    return (await imageRepository.imageGetList()).map(toImage).toList();
  }
}
