import 'package:json_annotation/json_annotation.dart';
part 'image_data_dto.g.dart';

/// DTO картинок
@JsonSerializable()
class ImageDataDto {
  final int id;
  final String url;
  final String? title;
  final String? text;

  ImageDataDto({
    required this.id,
    required this.url,
    this.title,
    this.text,
  });

  factory ImageDataDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDataDtoFromJson(json);

  @override
  String toString() {
    return 'ImageDataDto: {\n url: $url, id: $id,\n}';
  }

  Map<String, dynamic> toJson() => _$ImageDataDtoToJson(this);
}
