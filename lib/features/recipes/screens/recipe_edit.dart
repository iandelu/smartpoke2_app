import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/provider/unit_of_measure_provider.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/category/providers/catgories_provider.dart';
import 'package:meal_ai/features/category/widgets/category_chips.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/widgets/edit_recipe_widgets/edit_ingredient_section.dart';
import 'package:meal_ai/features/recipes/widgets/edit_recipe_widgets/edit_steps.dart';
import 'package:meal_ai/features/recipes/widgets/edit_recipe_widgets/text_field_section.dart';

import '../../category/widgets/category_selector.dart';

class EditRecipeScreen extends ConsumerStatefulWidget {
  late final RecipeModel recipe;


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
  late String _selectedDifficulty;
  late List<CategoryModel>? _selectedCategories;
  late final List<CategoryModel> _allCategories;


  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.recipe.name);
    _descriptionController = TextEditingController(text: widget.recipe.description);
    _cookingDuration = widget.recipe.totalTime;
    _ingredients = List.from(widget.recipe.recipeProducts);
    _steps = List.from(widget.recipe.recipeSteps);
    _selectedDifficulty = widget.recipe.difficulty;
    _selectedCategories = List.from(widget.recipe.categories);
    _allCategories = ref.read(categoryProvider).recipeCategories;
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
            onPressed: () => _saveRecipe(),
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
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Categories',
                  style: headline5,
                ),
                IconButton(
                  onPressed: () async {
                    final selectedCategories = await showDialog<List<CategoryModel>>(
                      context: context,
                      builder: (context) {
                        return CustomCategorySelector(
                          categories: _allCategories,
                          preselectedCategories: _selectedCategories ?? [],
                          onSelectionChanged: (selected) {
                            Navigator.of(context).pop(selected);
                          },
                        );
                      },
                    );
                    setState(() {
                      _selectedCategories = selectedCategories;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            if (_selectedCategories != null && _selectedCategories!.isNotEmpty)
              CategoryChips(categories: _selectedCategories!),
            SizedBox(height: 16),
            Text(
              'Difficulty',
              style: headline5,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDifficultyOption('EASY', '😄'),
                _buildDifficultyOption('MODERATE', '😐'),
                _buildDifficultyOption('KIND_OF_HARD', '🤨'),
                _buildDifficultyOption('HARD', '😡'),
              ],
            ),
            SizedBox(height: 16),
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

  Widget _buildDifficultyOption(String difficulty, String emoji) {
    final isSelected = _selectedDifficulty == difficulty; // Usar la variable de estado local
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDifficulty = difficulty; // Actualizar la dificultad seleccionada
        });
      },
      child: Column(
        children: [
          Text(
            emoji,
            style: TextStyle(
              fontSize: 24,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
          if (isSelected)
            Text(
              difficulty,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }

  void _saveRecipe() {
    RecipeModel updatedRecipe = widget.recipe.copyWith(
      name: _nameController.text,
      description: _descriptionController.text,
      totalTime: _cookingDuration,
      recipeProducts: _ingredients,
      recipeSteps: _steps,
      difficulty: _selectedDifficulty,
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



class CookingDurationSection extends StatefulWidget {
  final int initialDuration;
  final ValueChanged<int> onDurationChanged;

  CookingDurationSection({
    required this.initialDuration,
    required this.onDurationChanged,
  });

  @override
  _CookingDurationSectionState createState() => _CookingDurationSectionState();
}

class _CookingDurationSectionState extends State<CookingDurationSection> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialDuration.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cooking Duration (in minutes)',
          style: headline5,
        ),
        SizedBox(height: 8),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // Solo permite números
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusColor: black1,
          ),
          onChanged: (value) {
            int? duration = int.tryParse(value);
            if (duration != null) {
              widget.onDurationChanged(duration);
            }
          },
        ),
      ],
    );
  }
}

