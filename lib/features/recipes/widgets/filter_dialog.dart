import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> _selectedCategories = [];
  int? _selectedRating;
  int? _selectedTime;
  String? _selectedDifficulty;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filters'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            // Rating filter
            DropdownButton<int>(
              hint: Text('Select Rating'),
              value: _selectedRating,
              items: [1, 2, 3, 4, 5].map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRating = value;
                });
              },
            ),
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
            // Difficulty filter
            DropdownButton<String>(
              hint: Text('Select Difficulty'),
              value: _selectedDifficulty,
              items: ['Easy', 'Medium', 'Hard'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDifficulty = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
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
    );
  }
}