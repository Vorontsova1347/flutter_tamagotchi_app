import 'package:tamagochi_app/api/data/image_dto/image_dto.dart';
import 'package:tamagochi_app/features/common/domain/entities/image.dart';

Image toImage(ImageDto object) {
  return Image(
    url: object.url,
    id: object.id,
  );
}

ImageDto toImageDto(Image object) {
  return ImageDto(id: object.id, url: object.url);
}
