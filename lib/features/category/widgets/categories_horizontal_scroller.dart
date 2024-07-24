import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/category/models/category_models.dart';

class CategoriesHorizontalScroller extends StatelessWidget{

  final String title;
  const CategoriesHorizontalScroller({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = mockCategories;
    return  SizedBox(
      height: 45,
      child: ListView.separated(
        clipBehavior: Clip.none,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => CategoryItem(categories[index]),
      ),
    );
  }


}

class CategoryItem extends StatelessWidget{

    final CategoryModel category;
    const CategoryItem(this.category, {super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        width: 45,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
          boxShadow: const [
           BoxShadow(
            color: BrutColors.blackBrown, // Opacidad del 100%
            offset: Offset(4, 4), // Offset X, Y
            blurRadius: 0, // No blur
          ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${category.emoji}',
              style: AppTextStyles().emojiCategory,
            ),
          ],
        ),
      );
    }

}

class _Title extends StatelessWidget {

  final String? title;
  const _Title(this.title);

  @override
  Widget build(BuildContext context) {

    var titleStyle =  Theme.of(context).textTheme.titleMedium;
    return Row(
      children: [
        if ( title != null )
          Text(title!, style: titleStyle ),
      ],
    );
  }
}

const mockCategories = [
  CategoryModel(id: 1, name: 'Fruits', emoji: '🍏'),
  CategoryModel(id: 2, name: 'Vegetables', emoji: '🥦'),
  CategoryModel(id: 3, name: 'Dairy', emoji: '🧀'),
  CategoryModel(id: 4, name: 'Meat', emoji: '🍖'),
  CategoryModel(id: 5, name: 'Fast Food', emoji: '🍔'),
  CategoryModel(id: 6, name: 'Seafood', emoji: '🍤'),
  CategoryModel(id: 7, name: 'Desserts', emoji: '🍰'),
  CategoryModel(id: 8, name: 'Beverages', emoji: '🥤'),
  CategoryModel(id: 9, name: 'Snacks', emoji: '🍿'),
  CategoryModel(id: 10, name: 'Bakery', emoji: '🥐'),
  CategoryModel(id: 11, name: 'Grains', emoji: '🍚'),
  CategoryModel(id: 12, name: 'Condiments', emoji: '🥫'),
  CategoryModel(id: 13, name: 'Noodles', emoji: '🍜'),
  CategoryModel(id: 14, name: 'Sushi', emoji: '🍣'),
  CategoryModel(id: 15, name: 'Salads', emoji: '🥗'),
];