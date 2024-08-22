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
import 'package:meal_ai/features/recipes/widgets/edit_recipe_widgets/edit_ingredient_section.dart';
import 'package:meal_ai/features/recipes/widgets/edit_recipe_widgets/text_field_section.dart';

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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )
        ),
        centerTitle: true,
        title: const Text(
          'Edit Recipe',
          style: headline2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _saveRecipe;
            },
            icon: const Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
        ],
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
            _buildTextFieldSection('Description', _descriptionController, maxLines: 4),
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
        // Handle adding/editing cover photo
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 4),
          borderRadius: BorderRadius.circular(8),
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
