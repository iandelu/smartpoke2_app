
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';
import 'package:meal_ai/features/product/service/api_services/product_service.dart';
import 'package:meal_ai/features/product/service/local_services/product_hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class ProductProvider extends _$ProductProvider{
  final ProductHiveService _hiveService = ProductHiveService();
  final ProductService _apiService = ProductService();

  @override
  Future<List<ProductModel>> build() async {
    logger.d('Fetching product from Hive');
    final product = _hiveService.getProducts();
    logger.d('Successfully fetched product from Hive');
    return product;
  }

  Future<void> updateProduct(
      {required dynamic key, required ProductModel product}) async {
    logger.d('Attempting to update product');
    final addTime = DateTime.now().toString();
    final Map<String, dynamic> productJson = product.toJson();
    productJson['addTime'] = addTime;
    await _hiveService.updateProduct(key, productJson);
    logger.d('Successfully updated product');
    ref.invalidateSelf();
  }

  Future<ProductModel> getProductFromEan({required String ean}) async {
    logger.d('Fetching product from API');
    final product = await _apiService.fetchProductFromEan(ean);
    return product;
  }

  Future<void> addProductToHive({required ProductModel product}) async {
    final addDate = DateTime.now().toString();
    final Map<String, dynamic> productJson = product.toJson();
    productJson['addTime'] = addDate;
    await _hiveService.addProduct(productJson);
    ref.invalidateSelf();
  }

  Future<void> deleteProductFromHive({dynamic key}) async {
    await _hiveService.removeProduct(key);
    ref.invalidateSelf();
    await future;
  }

}