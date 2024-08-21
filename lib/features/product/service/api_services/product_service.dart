import 'package:meal_ai/config/connections/smartpoke_client.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';

class ProductService{

  Future<ProductModel> fetchProductFromEan(String ean) async {
    final response = await smartPokeClient.get('products/fetchProductInfo/$ean');

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      logger.d(response.statusCode);
      throw Exception('Something went wrong');
    }
  }

  Future<List<ProductModel>> fetchProducts(
      String query,
      {String? category,
        String? ean,
        String? brand,
        String? keywords}
      ) async {

    final response = await smartPokeClient.get('products',
        queryParams: {
          'name': query,
          'category': category,
          'ean': ean,
          'brand': brand,
          'keywords': keywords,
        });

    if (response.statusCode == 200) {
      List<dynamic> productsJson = response.data['content'];
      return productsJson
          .map(
              (json) => ProductModel.fromJson(json))
          .toList();

    } else {
      logger.d(response.statusCode);
      throw Exception('Something went wrong');
    }

  }
}