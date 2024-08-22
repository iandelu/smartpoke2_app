import 'package:flutter/material.dart';
import 'package:meal_ai/core/provider/unit_of_measure_provider.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/grocery_list_page/widgets/recipe_product_edit_sheet.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';


import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/grocery_list_page/widgets/recipe_product_edit_sheet.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditRecipeScreen extends ConsumerStatefulWidget {
  final RecipeModel recipe;

  EditRecipeScreen({required this.recipe});

  @override
  _EditRecipeScreenState createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends ConsumerState<EditRecipeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late int _cookingDuration;
  late List<RecipeProduct> _ingredients;
  late List<RecipeStep> _steps;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.recipe.name);
    _descriptionController = TextEditingController(text: widget.recipe.description);
    _cookingDuration = widget.recipe.totalTime;
    _ingredients = List.from(widget.recipe.recipeProducts);
    _steps = List.from(widget.recipe.recipeSteps);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unitOfMeasures = ref.watch(unitOfMeasureProvider).units;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        title: const Text(
          'Edit Recipe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoverPhotoSection(pictureUrl: widget.recipe.pictureUrl),
            SizedBox(height: 16),
            _buildTextFieldSection('Food Name', _nameController),
            SizedBox(height: 16),
            _buildTextFieldSection('Description', _descriptionController, maxLines: 3),
            SizedBox(height: 16),
            CookingDurationSection(
              initialDuration: _cookingDuration,
              onDurationChanged: (value) => setState(() {
                _cookingDuration = value;
              }),
            ),
            SizedBox(height: 24),
            IngredientsSection(
              ingredients: _ingredients,
              unitOfMeasures: unitOfMeasures,
              onIngredientChanged: (index, ingredient) => setState(() {
                _ingredients[index] = ingredient;
              }),
              onIngredientRemoved: (index) => setState(() {
                _ingredients.removeAt(index);
              }),
              onIngredientAdded: () => setState(() {
                _ingredients.add(RecipeProduct(id: _ingredients.length + 1));
              }),
            ),
            SizedBox(height: 24),
            StepsSection(
              steps: _steps,
              onStepChanged: (index, step) => setState(() {
                _steps[index] = step;
              }),
              onStepRemoved: (index) => setState(() {
                _steps.removeAt(index);
              }),
              onStepAdded: () => setState(() {
                _steps.add(RecipeStep(id: _steps.length + 1, position: _steps.length + 1));
              }),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _saveRecipe,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
                child: Text(
                  'Save Recipe',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldSection(String label, TextEditingController controller, {int maxLines = 1}) {
    return TextFieldSection(label: label, controller: controller, maxLines: maxLines);
  }

  void _saveRecipe() {
    RecipeModel updatedRecipe = widget.recipe.copyWith(
      name: _nameController.text,
      description: _descriptionController.text,
      totalTime: _cookingDuration,
      recipeProducts: _ingredients,
      recipeSteps: _steps,
    );

    Navigator.pop(context, updatedRecipe);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.black, width: 3),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.celebration, size: 60, color: Colors.orange),
            SizedBox(height: 16),
            Text('Upload Success', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Your recipe has been uploaded, you can see it on your profile.'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.black, width: 3),
                ),
              ),
              child: Text('Back to Home', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class CoverPhotoSection extends StatelessWidget {
  final String pictureUrl;

  CoverPhotoSection({required this.pictureUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle image upload
      },
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: pictureUrl.isNotEmpty
            ? Image.network(pictureUrl, fit: BoxFit.cover)
            : const Center(
          child: Text(
            'Add Cover Photo (up to 12 Mb)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class TextFieldSection extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  TextFieldSection({
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class CookingDurationSection extends StatelessWidget {
  final int initialDuration;
  final ValueChanged<int> onDurationChanged;

  CookingDurationSection({
    required this.initialDuration,
    required this.onDurationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cooking Duration (in minutes)', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
      ],
    );
  }
}

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

class StepsSection extends StatelessWidget {
  final List<RecipeStep> steps;
  final Function(int, RecipeStep) onStepChanged;
  final Function(int) onStepRemoved;
  final Function() onStepAdded;

  StepsSection({
    required this.steps,
    required this.onStepChanged,
    required this.onStepRemoved,
    required this.onStepAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Steps', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Column(
          children: steps.asMap().entries.map((entry) {
            int index = entry.key;
            RecipeStep step = entry.value;
            return ListTile(
              leading: Text(step.position.toString()),
              title: TextField(
                decoration: InputDecoration(
                  labelText: 'Tell a little about your food',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                controller: TextEditingController(text: step.description),
                style: TextStyle(fontWeight: FontWeight.bold),
                onChanged: (value) {
                  onStepChanged(index, step.copyWith(description: value));
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.black),
                onPressed: () {
                  // Handle adding/editing step image
                },
              ),
            );
          }).toList(),
        ),
        TextButton(
          onPressed: onStepAdded,
          child: Text('+ Step'),
        ),
      ],
    );
  }
}
