import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/category/widgets/categories_horizontal_scroller.dart';

class CategoriesWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesWidget({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: categories.map((category) => Material(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: InkWell(
          onTap: () {},
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.shadow), // Borde negro
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CategoryItem(category),
                  ],
                ),
                const SizedBox(height: PaddingSizes.sm),
                Text(
                  category.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      )).toList(),
    );
  }
}
