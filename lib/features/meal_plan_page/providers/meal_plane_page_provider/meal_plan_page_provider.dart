import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/meal_plan_page/services/meal_plan_hive_services.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'meal_plan_page_provider.g.dart';

@riverpod
class MealPlan extends _$MealPlan {
  final MealPlanHiveService _hiveService = MealPlanHiveService();

  @override
  FutureOr<List<RecipeModel>> build() async {
    logger.d('Fetching meal plan recipe from Hive');
    final recipe = _hiveService.getMealPlanRecipes();
    logger.d('Successfully fetched meal plan recipe from Hive');
    return recipe;
  }

  List<RecipeModel> getMealPlanRecipes() {
    logger.d('Fetching meal plan recipes from Hive');
    final recipe = _hiveService.getMealPlanRecipes();
    logger.d('Successfully Fetched meal plan recipe from Hive');
    return recipe;
  }

  Future<void> deleteMealPlanRecipeFromHive({dynamic key}) async {
    logger.d('Deleting meal plan recipe from Hive');
    await _hiveService.removeMealPlanRecipe(key);
    logger.d('Successfully deleted meal plan recipe from Hive');
    ref.invalidateSelf();
    await future;
  }

  Future<void> addMealPlanRecipeToHive(
      {required RecipeModel recipe, required DateTime addTime}) async {
    logger.d('Adding meal plan recipe to Hive');
    await _hiveService.addMealPlanRecipe({
      "host": recipe.source,
      "title": recipe.name,
      "total_time": recipe.totalTime,
      "image": recipe.pictureUrl,
      "ingredients": recipe.recipeProducts.map((e) => e.text).toList(),
      "instructions": recipe.recipeSteps.map((e) => e.description).toList(),
      "nutrients": recipe.nutrients,
      "servings": recipe.yields,
      "addTime": addTime.toString(),
    });
    logger.d('Successfully added meal plan recipe to Hive');
    ref.invalidateSelf();
  }
}
