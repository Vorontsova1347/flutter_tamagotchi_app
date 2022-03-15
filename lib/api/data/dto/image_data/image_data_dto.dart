import 'package:json_annotation/json_annotation.dart';
part 'image_data_dto.g.dart';

/// DTO картинок
@JsonSerializable()
class ImageDataDto {
  final int id;
  final String url;

  ImageDataDto({
    required this.id,
    required this.url,
  });

  factory ImageDataDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDataDtoFromJson(json);

  @override
  String toString() {
    return 'ImageDataDto: {\n url: $url, id: $id,\n}';
  }

  Map<String, dynamic> toJson() => _$ImageDataDtoToJson(this);
}
