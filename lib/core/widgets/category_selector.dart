import 'package:flutter/material.dart';

class CustomCategorySelector extends StatefulWidget {
  final List<String> categories;
  final List<String> preselectedCategories;
  final Function(List<String>) onSelectionChanged;

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
  late List<String> selectedCategories;

  @override
  void initState() {
    super.initState();
    selectedCategories = List.from(widget.preselectedCategories);
  }

  void _toggleCategory(String category) {
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
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Categories'),
      content: SingleChildScrollView(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: widget.categories.map((category) {
            final isSelected = selectedCategories.contains(category);
            return ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (_) => _toggleCategory(category),
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _closeSelector,
          child: Text('Close'),
        ),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Category Selector Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final selectedCategories = await showDialog<List<String>>(
                context: context,
                builder: (context) {
                  return CustomCategorySelector(
                    categories: ['Category 1', 'Category 2', 'Category 3', 'Category 4'],
                    preselectedCategories: ['Category 2'],
                    onSelectionChanged: (selected) {
                      Navigator.of(context).pop(selected);
                    },
                  );
                },
              );

              if (selectedCategories != null) {
                print('Selected Categories: $selectedCategories');
              }
            },
            child: Text('Select Categories'),
          ),
        ),
      ),
    );
  }
}