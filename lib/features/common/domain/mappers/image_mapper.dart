import 'package:tamagochi_app/api/data/dto/image_data/image_data_dto.dart';
import 'package:tamagochi_app/features/common/domain/entities/image_data.dart';

/// Конвертирует [ImageDataDto] в [ImageData]
ImageData toImageData(ImageDataDto object) {
  return ImageData(
    url: object.url,
    id: object.id,
  );
}

/// Конвертирует [ImageData] в [ImageDataDto]
ImageDataDto toImageDataDto(ImageData object) {
  return ImageDataDto(id: object.id, url: object.url);
}
