import 'package:json_annotation/json_annotation.dart';
part 'image_data_load.g.dart';

/// LOAD картинок
@JsonSerializable()
class ImageDataLoad {
  final String url;

  ImageDataLoad({
    required this.url,
  });

  factory ImageDataLoad.fromJson(Map<String, dynamic> json) =>
      _$ImageDataLoadFromJson(json);

  @override
  String toString() {
    return 'ImageDataLoad: {\n url: $url,\n}';
  }

  Map<String, dynamic> toJson() => _$ImageDataLoadToJson(this);
}
