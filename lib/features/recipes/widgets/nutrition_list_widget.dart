import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class NutritionListWidget extends StatelessWidget {
    final Map<String, String?> nutrientsMap;

  NutritionListWidget({
    Key? key,
    required RecipeModel recipe,
  })  : nutrientsMap = {
          'Calories': recipe.nutrients.calories.toString(),
          'Carbohydrate': recipe.nutrients.cabs.toString(),
          'Protein': recipe.nutrients.protein.toString(),
          'Fat': recipe.nutrients.fats.toString(),
          'Saturated Fat': recipe.nutrients.saturatedFats.toString(),
          'Sodium': recipe.nutrients.salt.toString(),
          'Fiber': recipe.nutrients.fiber.toString(),
          'Sugar': recipe.nutrients.sugars.toString(),
          'Serving Size': recipe.nutrients.amount.toString(),
        },
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: nutrientsMap.keys.length,
          itemBuilder: (context, index) {
            final nutrient = nutrientsMap.keys.elementAt(index);
            final nutrientValue = nutrientsMap[nutrient];

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nutrient,
                      style: AppTextStyles().mRegular.copyWith(fontSize: 20),
                    ),
                    Text(
                      nutrientValue ?? '--',
                      style: AppTextStyles()
                          .mThick
                          .copyWith(color: context.primaryColor, fontSize: 18),
                    ),
                  ],
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
