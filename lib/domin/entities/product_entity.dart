import 'package:blocproject/domin/entities/photo.dart';

class ProductEntity {
  final int id;
  final String brand;
  final String category;
  final String supCategory;
  final double price;
  final double salePrice;
  final bool isPupular;
  final String addedDate;
  final String details;
  final List<PhotoEntity>? photos;
  ProductEntity(
     {
    required this.id,
    required this.brand,
    required this.category,
    required this.supCategory,
    required this.price,
    required this.salePrice,
    required this.isPupular,
    required this.addedDate,
    required this.details,
    required this.photos,
  });
  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      brand: json['brand'],
      category: json['category'],
      supCategory: json['supCategory'],
      price: json['price'],
      salePrice: json['salePrice'],
      isPupular: json['isPupular'],
      addedDate: json['addedDate'],
      details: json['details'],
       photos: json['photos'],
      
    );
  }
}
