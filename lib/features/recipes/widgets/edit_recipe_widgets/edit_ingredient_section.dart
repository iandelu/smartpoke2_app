import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/grocery_list_page/widgets/recipe_product_edit_sheet.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class IngredientsSection extends StatelessWidget {
  final List<RecipeProduct> ingredients;
  final List<UnitOfMeasure> unitOfMeasures;
  final Function(int, RecipeProduct) onIngredientChanged;
  final Function(int) onIngredientRemoved;
  final Function() onIngredientAdded;

  IngredientsSection({
    required this.ingredients,
    required this.onIngredientChanged,
    required this.onIngredientRemoved,
    required this.onIngredientAdded,
    required this.unitOfMeasures,
  });

  void _showBottomSheet(BuildContext context,RecipeProduct recipeProduct, int index, Function(int, RecipeProduct) onUpdateGrocery, List<UnitOfMeasure> unitOfMeasures) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return RecipeProductEditSheet(
          recipeProduct: recipeProduct,
          onUpdateGrocery: onUpdateGrocery,
          unitOfMeasures: unitOfMeasures,
          index: index,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    onUpdateRecipeProduct(index, product) {
      final ingredient = ingredients[index].copyWith(
        amount: product.amount,
        ingredientName: product.ingredientName,
        unitOfMeasure: product.unitOfMeasure,
        product: product.product,
      );
      onIngredientChanged(index, ingredient);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Ingredients', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextButton(
              onPressed: onIngredientAdded,
              child: Text('+ Ingredient'),
            ),
          ],
        ),
        Column(
          children: ingredients.asMap().entries.map((entry) {
            int index = entry.key;
            RecipeProduct ingredient = entry.value;
            return ListTile(
              onTap: () {
                _showBottomSheet(context, ingredient, index, onUpdateRecipeProduct, unitOfMeasures);
              },
              title: Text(
                '${ingredient.amount}${ingredient.unitOfMeasure?.name ?? ''} - ${ingredient.ingredientName}',
                style: const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
              trailing: Text(
                ingredient.product?.category?.emoji ?? '🍽️',
                style: AppTextStyles().emojiCategory,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
