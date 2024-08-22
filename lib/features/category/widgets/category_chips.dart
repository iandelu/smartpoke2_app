import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/features/category/models/category_models.dart';

class CategoryChips extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryChips({required this.categories, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: categories.map((category) {
        return Chip(
          label: Text(
            "${category.name.toUpperCase()} ${category.emoji ?? '🍽️'}",
            style: const TextStyle(
              color: cream1,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: black1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(color: black1, width: 2.0),
          ),
        );
      }).toList(),
    );
  }
}
