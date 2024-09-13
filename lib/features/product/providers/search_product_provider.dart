


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';
import 'package:meal_ai/features/product/service/api_services/product_service.dart';
import 'package:meal_ai/features/recipes/search/search_recipe_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedProductsNotifier = StateNotifierProvider<SearchedProductsProvider, List<ProductModel>>((ref) {
  return SearchedProductsProvider(ProductService(), ref);
});

class SearchedProductsProvider extends StateNotifier<List<ProductModel>>{

  String? _category;
  String? _brand;
  String? _keywords;
  final ProductService productService;
  final Ref ref;

  SearchedProductsProvider(this.productService, this.ref) : super([]);

  void setFilters(String category, String brand, String keywords) {
    _category = category;
    _brand = brand;
    _keywords = keywords;
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    List<ProductModel> products = await productService
        .fetchProducts(
        query,
        category: _category,
        brand: _brand,
        keywords: _keywords);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = products;
    return state;
  }


}