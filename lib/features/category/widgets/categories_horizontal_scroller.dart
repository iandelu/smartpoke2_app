import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/category/services/api_services/smartpoke_api_service.dart';

class CategoriesHorizontalScroller extends StatelessWidget{
  final SmartpokeCategoryApiService _apiService = SmartpokeCategoryApiService();
  final String title;
  CategoriesHorizontalScroller({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _buildFutureContent(context),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return snapshot.data ?? Container();
        }
      },
    );
  }

  Future<Widget> _buildFutureContent(BuildContext context) async {
    final List<CategoryModel> categories = await _apiService.getRecipeCategories();
    return  SizedBox(
      height: 60,
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
      return Column(
        children: [
          Container(
            width: 40,
            height: 40,
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
          ),
          Text(
            category.name,
            style: AppTextStyles().sRegular,
          ),
        ],
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
  CategoryModel( name: 'Fruits', emoji: '🍏'),
  CategoryModel( name: 'Vegetables', emoji: '🥦'),
  CategoryModel( name: 'Dairy', emoji: '🧀'),
  CategoryModel( name: 'Meat', emoji: '🍖'),
  CategoryModel( name: 'Fast Food', emoji: '🍔'),
  CategoryModel( name: 'Seafood', emoji: '🍤'),
  CategoryModel( name: 'Desserts', emoji: '🍰'),
  CategoryModel(name: 'Beverages', emoji: '🥤'),
  CategoryModel(name: 'Snacks', emoji: '🍿'),
  CategoryModel(name: 'Bakery', emoji: '🥐'),
  CategoryModel(name: 'Grains', emoji: '🍚'),
  CategoryModel(name: 'Condiments', emoji: '🥫'),
  CategoryModel(name: 'Noodles', emoji: '🍜'),
  CategoryModel(name: 'Sushi', emoji: '🍣'),
  CategoryModel(name: 'Salads', emoji: '🥗'),
];