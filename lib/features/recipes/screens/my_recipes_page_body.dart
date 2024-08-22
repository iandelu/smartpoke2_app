import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/core/widgets/searchbar_widget.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/category/providers/catgories_provider.dart';
import 'package:meal_ai/features/category/widgets/categories_horizontal_scroller.dart';
import 'package:meal_ai/features/recipes/search/recipe_search_delegate.dart';
import 'package:meal_ai/features/recipes/search/search_recipe_provider.dart';
import 'package:meal_ai/features/recipes/widgets/recipe_widget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyRecipesPageBody extends ConsumerStatefulWidget {
  const MyRecipesPageBody({
    super.key,
  });


  @override
  _MyRecipesPageBody createState() => _MyRecipesPageBody();
}

class _MyRecipesPageBody extends ConsumerState<MyRecipesPageBody> {

  late List<CategoryModel> categories;

  void _getInitialInfo(){
    categories  = ref.watch(categoryProvider).recipeCategories;

  }

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    var isLoading = ref.watch(categoryProvider).isLoading;
    if (isLoading) return const Center(child: CircularProgressIndicator());

    var categories = ref.watch(categoryProvider).recipeCategories;


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
                CategoriesHorizontalScroller(title: 'Categories', categories: categories),
                const SizedBox(height: PaddingSizes.mdl),
                Padding(
                  padding: const EdgeInsets.only(top: PaddingSizes.xxxs),
                  child: Row(
                    children: [
                      const Text(
                        'Your Recipes',
                        style: headline3,
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      CustomIconButton(
                        icon: Icons.book,
                        onPressed: () {
                          final searchedRecipes = ref.read(searchedRecipesNotifier);

                          showSearch(
                            context: context,
                            delegate: RecipeSearchDelegate(
                              ref,
                              initialRecipes: searchedRecipes,
                            ),
                          ).then((id) {
                            if ( id == null ) return;
                            context.push('/recipe/$id');
                            });

                        },
                      ),
                      const SizedBox(width: PaddingSizes.xs,)
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
