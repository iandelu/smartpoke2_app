import 'package:dio/dio.dart';
import 'package:meal_ai/config/connections/smartpoke_client.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/category/models/category_models.dart';

class SmartpokeCategoryApiService {

  Future<List<CategoryModel>> getAllCategories() async {
    final response = await smartPokeClient.get(
      '/categories/all',
    );

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> categoriesJson = await response.data;
      return categoriesJson.map((category) => CategoryModel.fromJson(category)).toList();

    } else {
      logger.d(response.statusCode);
      throw Exception('Something went wrong');
    }

  }

  Future<List<CategoryModel>> getRecipeCategories() async {
    final response = await smartPokeClient.get(
      'categories/recipe',
    );

    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = await response.data;
      return categoriesJson.map((category) => CategoryModel.fromJson(category)).toList();

    } else {
      logger.d(response.statusCode);
      throw Exception('Something went wrong');
    }

  }

  Future<List<CategoryModel>> getProductCategories() async {
    final response = await smartPokeClient.get(
      '/categories/product',
    );

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> categoriesJson = await response.data;
      return categoriesJson.map((category) => CategoryModel.fromJson(category)).toList();

    } else {
      logger.d(response.statusCode);
      throw Exception('Something went wrong');
    }

  }

}
