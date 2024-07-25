import 'package:dio/dio.dart';
import 'package:meal_ai/config/connections/smartpoke_client.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/category/models/category_models.dart';

class SmartpokeCategoryApiService {

  Future<List<CategoryModel>> getAllCategories() async {
    try {
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
    } catch (e, st) {
      logger.d('Error', error: e, stackTrace: st);
      throw Exception('Error: $e');
    }
  }

  Future<List<CategoryModel>> getRecipeCategories() async {
    try {
      final response = await Dio().get(
        'http://10.0.2.2:8082/api/categories/recipe');

      if (response.statusCode == 200) {
        List<dynamic> categoriesJson = await response.data;
        return categoriesJson.map((category) => CategoryModel.fromJson(category)).toList();

      } else {
        logger.d(response.statusCode);
        throw Exception('Something went wrong');
      }
    } catch (e, st) {
      logger.d('Error', error: e, stackTrace: st);
      throw Exception('Error: $e');
    }
  }

  Future<List<CategoryModel>> getProductCategories() async {
    try {
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
    } catch (e, st) {
      logger.d('Error', error: e, stackTrace: st);
      throw Exception('Error: $e');
    }
  }

}
