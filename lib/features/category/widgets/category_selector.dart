import 'package:flutter/material.dart';
import 'package:meal_ai/features/category/models/category_models.dart';

class CustomCategorySelector extends StatefulWidget {
  final List<CategoryModel> categories;
  final List<CategoryModel> preselectedCategories;
  final Function(List<CategoryModel>) onSelectionChanged;

  const CustomCategorySelector({
    Key? key,
    required this.categories,
    required this.onSelectionChanged,
    this.preselectedCategories = const [],
  }) : super(key: key);

  @override
  _CustomCategorySelectorState createState() => _CustomCategorySelectorState();
}

class _CustomCategorySelectorState extends State<CustomCategorySelector> {
  late List<CategoryModel> selectedCategories;

  @override
  void initState() {
    super.initState();
    selectedCategories = List.from(widget.preselectedCategories);
  }

  void _toggleCategory(CategoryModel category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

  void _closeSelector() {
    widget.onSelectionChanged(selectedCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(24.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 4.0),
            borderRadius: BorderRadius.circular(0), // Sin bordes redondeados para una apariencia más brutalista
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'SELECT CATEGORIES',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: widget.categories.map((category) {
                    final isSelected = selectedCategories.contains(category);
                    return ChoiceChip(
                      label: Text(
                        "${category.name.toUpperCase()} ${category.emoji ?? '🍽️'}",
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: Colors.black,
                      backgroundColor: Colors.grey[200],
                      onSelected: (_) => _toggleCategory(category),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: _closeSelector,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    'CLOSE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
