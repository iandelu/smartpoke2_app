import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/services/api_services/recipe_service.dart';
import 'package:meal_ai/features/recipes/services/local_services/recipe_hive_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'recipe_from_url_provider.g.dart';

@riverpod
class RecipeFromUrl extends _$RecipeFromUrl {
  final RecipeHiveService _hiveService = RecipeHiveService();
  final RecipeApiService _apiService = RecipeApiService();

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
    final addTime = DateTime.now();
    recipe = recipe.copyWith(
        addTime: addTime.toString(),
        lastUpdateDate: addTime
    );

    final recipeSaved = await _apiService.updateRecipe(recipe: recipe);

    if (key == null) {
      addRecipeFromUrlToHive(recipe: recipeSaved);
    }else{
      final Map<String, dynamic> recipeJson = recipeSaved.toJson();;
      await _hiveService.updateRecipe(key, recipeJson);
    }

    logger.d('Successfully updated recipe');
    ref.invalidateSelf();
  }

  Future<RecipeModel> getRecipeFromUrl({required String url}) async {
    logger.d('Fetching recipe from API');
    final recipe = await _apiService.getRecipeFromUrl(url: url);
    return recipe;
  }

  Future<RecipeModel> getRecipeFromId({required int id}) async {
    logger.d('Fetching recipe from API by id: $id');
    final recipe = await _apiService.getRecipeFromId(id: id);
    return recipe;
  }

  Future<RecipeModel> createRecipe({required RecipeModel recipe}) async {
    logger.d('Creating recipe from API');
    final recipeSaved = await _apiService.createRecipe(recipe: recipe);
    await addRecipeFromUrlToHive(recipe: recipeSaved);
    return recipeSaved;
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
