import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meal_ai/config/connections/smartpoke_client.dart';
import 'package:meal_ai/core/utils/helper_methods.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/services/local_services/recipe_hive_service.dart';

class RecipeApiService {
  final RecipeHiveService hiveService = RecipeHiveService();

  Future<RecipeModel> getRecipeFromUrl({required String url}) async {
    final apiUrl =
        Uri.parse('http://localhost:8082/api/recipes/from_url');

    final response = await smartPokeClient.post(
      'recipes/from_url',
      data: {'url': url}
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return RecipeModel.fromJson(response.data);
    } else {
      logger.d(response.statusCode);
      throw Exception('Something went wrong');
    }

  }

  Future<RecipeModel> createRecipe({required RecipeModel recipe}) async {
    final response = await smartPokeClient.post('recipes', data: recipe.toJson());

    if (response.statusCode == 200 || response.statusCode == 201) {
      return RecipeModel.fromJson(response.data);
    } else {
      logger.d(response.statusCode);
      throw Exception('Something went wrong');
    }
  }

  Future<List<RecipeModel>> fetchRecipes(String query, {required List<CategoryModel> category, int? rating, int? time, String? difficulty}) async {

    final categoriesString = category.map((e) => e.name).toList().join(',');
    final response = await smartPokeClient.get('recipes',
                      queryParams: {
                      'name': query,
                      'categories': categoriesString,
                      'rating': rating,
                      'time': time,
                      'difficulty': difficulty
                    });

    if (response.statusCode == 200) {
      List<dynamic> recipesJson = response.data['content'];
      return recipesJson
          .map(
              (json) => RecipeModel.fromJson(json))
          .toList();

    } else {
      logger.d(response.statusCode);
      throw Exception('Something went wrong');
    }
  }

  Future<RecipeModel> getRecipeFromId({required int id}) async {
    final response = await smartPokeClient.get('recipes/$id');

    if (response.statusCode == 200) {
      return RecipeModel.fromJson(response.data);
    } else {
      logger.d(response.statusCode);
      throw Exception('Something went wrong');
    }
  }

  Future<RecipeModel> updateRecipe({required RecipeModel recipe}) {
    return smartPokeClient.put('recipes/${recipe.id}', data: recipe.toJson())
        .then((response) {
      if (response.statusCode == 200) {
        return RecipeModel.fromJson(response.data);
      } else {
        logger.d(response.statusCode);
        throw Exception('Something went wrong');
      }
    });
  }

}
