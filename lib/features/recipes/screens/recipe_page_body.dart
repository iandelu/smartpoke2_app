import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/widgets/searchbar_widget.dart';
import 'package:meal_ai/features/category/widgets/categories_horizontal_scroller.dart';
import 'package:meal_ai/features/recipes/widgets/recipe_widget.dart';

class RecipePageBody extends StatelessWidget {
  const RecipePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: _appBar(context),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingSizes.md),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SearchBarWidget(showFilter: true),
                  const SizedBox(height: PaddingSizes.sm),
                  CategoriesHorizontalScroller(title: 'Categories'),
                  const SizedBox(height: PaddingSizes.sm),
                  Padding(
                    padding: const EdgeInsets.only(top: PaddingSizes.xxxs),
                    child: Row(
                      children: [
                        Text(
                          'Your Recipes',
                          style: AppTextStyles().mThick,
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        TextButton(
                            onPressed: () {},
                            child:
                                Text('See Cookbook', style: AppTextStyles().mThick))
                      ],
                    ),
                  ),
                  const RecipeWidget(),
                  const SizedBox(height: PaddingSizes.sm),
                ],
              ),
            ),
          ),
        ),
      );
  }
}

AppBar _appBar(BuildContext context){
  return AppBar(
    title: Text(
      'Recipes',
      style: AppTextStyles().lThick,
    ),
    centerTitle: false,
    elevation: 0,
  );
}
