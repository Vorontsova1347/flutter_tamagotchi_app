
class Image {
  final int id;
  final String url;

  Image({
    required this.id,
    required this.url,
  });

  @override
  String toString() {
    return 'Image: {\n id: $id,\n url: $url,\n}';
  }
}
