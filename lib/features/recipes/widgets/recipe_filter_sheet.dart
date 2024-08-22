import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../category/widgets/category_selector.dart';

class RecipeFilterSheet extends ConsumerStatefulWidget {
  final List<CategoryModel> allCategories;
  final List<CategoryModel>? selectedCategories;
  final int? selectedRating;
  final int? selectedTime;
  final String? selectedDifficulty;

  const RecipeFilterSheet(
      {super.key,
        required this.allCategories,
        required this.selectedCategories,
        required this.selectedRating,
        required this.selectedTime,
        required this.selectedDifficulty
      });

  @override
  _RecipeFilterSheetState createState() => _RecipeFilterSheetState();
}

class _RecipeFilterSheetState extends ConsumerState<RecipeFilterSheet> {
  List<CategoryModel>? _selectedCategories;
  int _selectedRating = 0;
  int? _selectedTime;
  String? _selectedDifficulty;

  @override
  void initState() {
    super.initState();
    _selectedCategories = widget.selectedCategories;
    _selectedRating = widget.selectedRating ?? 0;
    _selectedTime = widget.selectedTime;
    _selectedDifficulty = widget.selectedDifficulty;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9, // Hacer el BottomSheet más ancho
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filters',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Categories'),
                IconButton(
                  onPressed: () async {
                    final selectedCategories = await showDialog<List<CategoryModel>>(
                      context: context,
                      builder: (context) {
                        return CustomCategorySelector(
                          categories: widget.allCategories,
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
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: _selectedCategories!.map((category) {
                  return Chip(
                    label: Text(
                      "${category.name.toUpperCase()} ${category.emoji ?? '🍽️'}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                      side: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  );
                }).toList(),
              ),
            const SizedBox(height: 16),
            Text('Rating'),
            RatingBar.builder(
              initialRating: _selectedRating.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _selectedRating = rating.toInt();
                });
              },
            ),
            const SizedBox(height: 16),
            // Time filter
            DropdownButton<int>(
              hint: Text('Select Time (minutes)'),
              value: _selectedTime,
              items: [10, 20, 30, 40, 50, 60].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTime = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Difficulty filter
            Text('Difficulty'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDifficultyOption('Easy', '😄'),
                _buildDifficultyOption('Medium', '😐'),
                _buildDifficultyOption('Hard', '😡'),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text('Apply'),
              onPressed: () {
                Navigator.of(context).pop({
                  'categories': _selectedCategories,
                  'rating': _selectedRating,
                  'time': _selectedTime,
                  'difficulty': _selectedDifficulty,
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyOption(String difficulty, String emoji) {
    final isSelected = _selectedDifficulty == difficulty;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDifficulty = difficulty;
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
}