import 'package:json_annotation/json_annotation.dart';
part 'image_dto.g.dart';

@JsonSerializable()
class ImageDto {
  final int id;
  final String url;

  ImageDto({
    required this.id,
    required this.url,
  });

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  @override
  String toString() {
    return 'ImageDto: {\n url: $url, id: $id,\n}';
  }

  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}
