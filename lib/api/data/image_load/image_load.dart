import 'package:json_annotation/json_annotation.dart';
part 'image_load.g.dart';

@JsonSerializable()
class ImageLoad {
  final String url;

  ImageLoad({
    required this.url,
  });

  factory ImageLoad.fromJson(Map<String, dynamic> json) =>
      _$ImageLoadFromJson(json);

  @override
  String toString() {
    return 'ImageLoad: {\n url: $url,\n}';
  }

  Map<String, dynamic> toJson() => _$ImageLoadToJson(this);
}
