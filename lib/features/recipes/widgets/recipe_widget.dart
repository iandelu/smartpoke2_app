import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/provider/search_provider.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/providers/recipe_from_url_provider/recipe_from_url_provider.dart';
import 'package:meal_ai/features/recipes/screens/recipe_detail.dart';

class RecipeWidget extends ConsumerStatefulWidget {
  const RecipeWidget({super.key});

  @override
  ConsumerState<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends ConsumerState<RecipeWidget> {
  @override
  Widget build(BuildContext context) {
    final recipe = ref.watch(recipeFromUrlProvider);
    final searchRecipe = ref.watch(searchRecipeProvider);
    return recipe.maybeWhen(
        error: (error, stackTrace) {
          logger.d('Error', error: error, stackTrace: stackTrace);
          return const Center(
            child: Text('Something went wrong!'),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (recipes) {
          if (recipes.isEmpty) {
            return Center(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).width * 1.2,
                child: const Column(
                  children: [
                    Expanded(child: SizedBox.shrink()),
                    Text('Add Recipes to see here'),
                    Expanded(child: SizedBox.shrink()),
                  ],
                ),
              ),
            );
          } else {
            List<RecipeModel> filteredRecipes = recipes.where((RecipeModel recipe) {
              return recipe.name
                  .toLowerCase()
                  .contains(searchRecipe.toLowerCase());
            }).toList();
            final recipeList = searchRecipe.isEmpty ? recipes : filteredRecipes;
            return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recipeList.length,
              itemBuilder: (context, index) {
                searchRecipe;
                final recipe = recipeList[index];
                return RecipeCardWidget(recipe: recipe);
              },
            );
          }
        },
        orElse: () => const SizedBox.shrink());
  }
}

class RecipeCardWidget extends ConsumerStatefulWidget {
  const RecipeCardWidget({super.key, required this.recipe});
  final RecipeModel recipe;

  @override
  ConsumerState<RecipeCardWidget> createState() => _RecipeCardWidgetState();
}

class _RecipeCardWidgetState extends ConsumerState<RecipeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          const SizedBox(height: 10),
          CupertinoContextMenu(
            actions: [
              Builder(
                builder: (cupertinoContext) => CupertinoContextMenuAction(
                    child: const Text('Delete'),
                    onPressed: () async {
                      await ref
                          .read(recipeFromUrlProvider.notifier)
                          .deleteRecipeFromHive(key: widget.recipe.id);
                      if (!mounted) return;
                      Navigator.pop(cupertinoContext);
                    }),
              ),
              Builder(builder: (cupertinoContext) {
                return CupertinoContextMenuAction(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(cupertinoContext);
                  },
                );
              })
            ],
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          RecipeDetail(recipe: widget.recipe))),
              child: Container(
                height: 160,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: kStandardBorderRadius,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                        image:
                            CachedNetworkImageProvider(widget.recipe.pictureUrl))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: PaddingSizes.sm, top: PaddingSizes.mdl),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.recipe.name,
                          textAlign: TextAlign.start,
                          style: AppTextStyles()
                              .mThick
                              .copyWith(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Serving ${widget.recipe.yields.toString()}',
                          textAlign: TextAlign.left,
                          style: AppTextStyles()
                              .mThick
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: PaddingSizes.xs,
          ),
        ],
      ),
    );
  }
}
