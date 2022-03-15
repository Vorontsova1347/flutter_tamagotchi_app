/// Сущность картинки
class ImageData {
  final int id;
  final String url;

  ImageData({
    required this.id,
    required this.url,
  });

  @override
  String toString() {
    return 'ImageData: {\n id: $id,\n url: $url,\n}';
  }
}
