/// Сущность картинки
class ImageData {
  final int id;
  final String url;
  final String? title;
  final String? text;

  ImageData({
    required this.id,
    required this.url,
    this.title,
    this.text,
  });

  @override
  String toString() {
    return 'ImageData: {\n id: $id,\n url: $url,\n}';
  }
}
