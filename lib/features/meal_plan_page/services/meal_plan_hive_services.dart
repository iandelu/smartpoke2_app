import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/core/utils/helper_methods.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class MealPlanHiveService {
  final _recipeFromApi = Hive.box('meal_plan_recipe');

  Future<void> addMealPlanRecipe(RecipeModel recipe, DateTime addTime) async {
    final recipeWithTime = recipe.copyWith(addTime: addTime.toString());
    await _recipeFromApi.add(recipeWithTime.toJson());
  }

  Future<void> removeMealPlanRecipe(dynamic key) async {
    await _recipeFromApi.delete(key);
  }

  List<RecipeModel> getMealPlanRecipes() {
    final data = _recipeFromApi.keys.map((key) {
      final item = _recipeFromApi.get(key);
      return RecipeModel.fromJson(item);
    }).toList();
    return data;
  }
}
