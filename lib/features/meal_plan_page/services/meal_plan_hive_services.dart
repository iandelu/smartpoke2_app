import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/core/utils/helper_methods.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class MealPlanHiveService {
  final _recipeFromApi = Hive.box('meal_plan_recipe');

  Future<void> addMealPlanRecipe(RecipeModel recipe, DateTime addTime) async {
    final recipeWithTime = recipe.copyWith(addTime: addTime.toString());
    Map<String, dynamic> recipeMap = recipeWithTime.toJson();
    await _recipeFromApi.add(recipeMap);
  }

  Future<void> removeMealPlanRecipe(dynamic key) async {
    await _recipeFromApi.delete(key);
  }

  List<RecipeModel> getMealPlanRecipes() {
    final data = _recipeFromApi.keys.map((key) {
      final item = _recipeFromApi.get(key);
      item['key'] = key;
      return item;
    }).toList();
    return data.map((e) => RecipeModel.fromJson(parser(e))).toList();
  }
}
