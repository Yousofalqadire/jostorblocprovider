import 'dart:convert';

import 'package:blocproject/domin/entities/photo.dart';
import 'package:blocproject/domin/entities/product_entity.dart';


import 'package:http/http.dart' as http;

import '../../app/screens/general/constant.dart';

abstract class ProductsDataSource {
  Future<List<ProductEntity>> getProductsFromDataSource();
}

class ProductDataSourceImpl implements ProductsDataSource {
  final  http.Client client;
  ProductDataSourceImpl({required this.client});
  @override
  Future<List<ProductEntity>> getProductsFromDataSource() async {
    List<ProductEntity> products = [];
    final response = await client.get(
      Uri.parse('${ConstantValues.BASE_URL}products/get-products'),
    );
    var jsonBody = jsonDecode(response.body);
    for (Map item in jsonBody) {
      List<PhotoEntity> photos = [];
      for (final ph in item['photos']) {
        PhotoEntity photoEntity = PhotoEntity(
            id: ph['id'],
            publicId: ph['publicId'],
            url: ph['url'],
            productId: ph['productId']);
        photos.add(photoEntity);
      }
      ProductEntity productEntity = ProductEntity(
          id: item['id'],
          brand: item['brand'],
          category: item['category'],
          supCategory: item['supCategory'],
          price: item['price'],
          salePrice: item['salePrice'],
          isPupular: item['isPupular'],
          addedDate: item['addedDate'],
          details: item['details'],
          photos: photos);
      products.add(productEntity);
    }
    return products;
  }
}
