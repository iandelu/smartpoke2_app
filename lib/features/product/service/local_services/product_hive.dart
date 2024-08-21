import 'package:hive_flutter/adapters.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';

class ProductHiveService{
  final _productFromApi = Hive.box('products');

  Future<void> addProduct(Map<String, dynamic> item) async {
    await _productFromApi.add(item);
  }

  Future<void> removeProduct(dynamic key) async {
    await _productFromApi.delete(key);
  }

  Future<void> updateProduct(dynamic key, Map<String, dynamic> product) async {
    await _productFromApi.put(key, product);
  }

  List<ProductModel> getProducts() {
    final data = _productFromApi.keys.map((key) {
      final item = _productFromApi.get(key);
      item['key'] = key;
      return item;
    }).toList();
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

}