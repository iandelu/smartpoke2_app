import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/services/api_services/smartpoke_api_service.dart';
import 'package:meal_ai/features/recipes/services/local_services/smarpoke_hive_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'recipe_from_url_provider.g.dart';

@riverpod
class RecipeFromUrl extends _$RecipeFromUrl {
  final SmartPokeRecipeHiveService _hiveService = SmartPokeRecipeHiveService();
  final SmartpokeRecipeApiService _apiService = SmartpokeRecipeApiService();

  @override
  Future<List<RecipeModel>> build() async {
    logger.d('Fetching recipe from Hive');
    final recipe = _hiveService.getRecipes();
    logger.d('Successfully fetched recipe from Hive');
    return recipe;
  }

  Future<void> updateRecipe(
      {required dynamic key, required RecipeModel recipe}) async {
    logger.d('Attempting to update recipe');
    final addTime = DateTime.now().toString();
    final Map<String, dynamic> recipeJson = recipe.toJson();
    recipeJson['addTime'] = addTime;
    await _hiveService.updateRecipe(key, recipeJson);
    logger.d('Successfully updated recipe');
    ref.invalidateSelf();
  }

  Future<RecipeModel> getRecipeFromUrl({required String url}) async {
    logger.d('Fetching recipe from API');
    final recipe = await _apiService.getRecipeFromUrl(url: url);
    return recipe;
  }

  Future<void> addRecipeFromUrlToHive({required RecipeModel recipe}) async {
    final addDate = DateTime.now().toString();
    final Map<String, dynamic> recipeJson = recipe.toJson();
    recipeJson['addTime'] = addDate;
    await _hiveService.addRecipe(recipeJson);
    ref.invalidateSelf();
  }

  Future<void> deleteRecipeFromHive({dynamic key}) async {
    await _hiveService.removeRecipe(key);
    ref.invalidateSelf();
    await future;
  }
}
