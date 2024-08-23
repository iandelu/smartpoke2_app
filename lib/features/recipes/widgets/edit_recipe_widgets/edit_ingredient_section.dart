import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/widgets/expandable_text.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/category/widgets/categories_horizontal_scroller.dart';
import 'package:meal_ai/features/grocery_list_page/widgets/recipe_product_edit_sheet.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class IngredientsSection extends StatefulWidget {
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

  @override
  State<IngredientsSection> createState() => _IngredientsSectionState();
}

class _IngredientsSectionState extends State<IngredientsSection> {
  void _showBottomSheet(BuildContext context,
      RecipeProduct recipeProduct,
      int index,
      Function(int, RecipeProduct) onUpdateGrocery, List<UnitOfMeasure> unitOfMeasures) {
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

  void onDismissedItem(int index) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Producto eliminado'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    onUpdateRecipeProduct(index, product) {
      final ingredient = widget.ingredients[index].copyWith(
        amount: product.amount,
        ingredientName: product.ingredientName,
        unitOfMeasure: product.unitOfMeasure,
        product: product.product,
      );
      widget.onIngredientChanged(index, ingredient);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Ingredients', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextButton(
              onPressed: widget.onIngredientAdded,
              child: Text('+ Ingredient'),
            ),
          ],
        ),
        Column(
          children: widget.ingredients.asMap().entries.map((entry) {
            int index = entry.key;
            RecipeProduct ingredient = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Dismissible(
                key: Key(entry.key.toString()),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismissedItem(entry.key);
                },
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [shadowMediumBrut],
                    border: Border.all(
                      color: black1,
                      width: 2.0,
                    ),
                    color: cream1,
                  ),
                  child: ListTile(
                      onTap: () {
                        _showBottomSheet(context, ingredient, index, onUpdateRecipeProduct, widget.unitOfMeasures);
                      },
                      title: ExpandableTextWidget(
                        text: '${ingredient.amount}${ingredient.unitOfMeasure?.name ?? ''} - ${ingredient.product?.description ?? ingredient.product?.name ?? ingredient.ingredientName}',
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Container(
                        height: 33,
                        width: 33,
                        child: CategoryItem(
                          CategoryModel(
                            name: ingredient.product?.category?.name ?? '🍽️',
                            emoji: ingredient.product?.category?.emoji ?? '🍽️',
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
