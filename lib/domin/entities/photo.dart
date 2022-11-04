// ignore_for_file: public_member_api_docs, sort_constructors_first
class PhotoEntity {
  final int id;
  final String publicId;
  final String url;
  final int productId;
  PhotoEntity({
    required this.id,
    required this.publicId,
    required this.url,
    required this.productId,
  });

  factory PhotoEntity.fromJson(Map<String, dynamic> json) {
    return PhotoEntity(
        id: json['id'],
        publicId: json['publicId'],
        url: json['url'],
        productId: json['productId']);
  }
}
