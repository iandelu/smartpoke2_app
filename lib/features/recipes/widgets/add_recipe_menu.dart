import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/providers/recipe_from_url_provider/recipe_from_url_provider.dart';
import 'package:meal_ai/features/recipes/screens/recipe_edit.dart';
import 'package:pull_down_button/pull_down_button.dart';

import 'enter_url_dialog_widget.dart';

class AddRecipeMenu extends ConsumerStatefulWidget {
  const AddRecipeMenu({super.key, required this.builder});
  final PullDownMenuButtonBuilder builder;

  @override
  ConsumerState<AddRecipeMenu> createState() => _MealPlanMenuState();
}

class _MealPlanMenuState extends ConsumerState<AddRecipeMenu> {

  Future<void> _createNewRecipeFromScratch() async {
    RecipeModel newRecipe = RecipeModel(key: null, id: null, name: '');

    newRecipe = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditRecipeScreen(recipe: newRecipe),
      ),
    );

    if (newRecipe == null) {
      return;
    }

    ref.read(recipeFromUrlProvider.notifier)
        .createRecipe(recipe: newRecipe);
  }

  @override
  Widget build(BuildContext context) {
    return PullDownButton(
        itemBuilder: (context) => [
              PullDownMenuItem(
                title: 'From Scratch',
                onTap: () {

                  _createNewRecipeFromScratch();

                },
                icon: CupertinoIcons.pencil,
              ),
              PullDownMenuItem(
                title: 'Enter Url',
                icon: Icons.link,
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    useRootNavigator: true,
                    builder: (context) {
                      return const EnterUrlDialogWidget();
                    },
                  );
                },
              ),
              PullDownMenuItem(
                title: 'Scan Recipe',
                onTap: () {},
                icon: Icons.document_scanner_outlined,
              ),
              PullDownMenuItem(
                onTap: () {},
                title: 'Pick Image',
                icon: Icons.image_outlined,
              ),
              PullDownMenuItem(
                onTap: () {},
                title: 'Choose PDF',
                icon: Icons.picture_as_pdf_outlined,
              ),
            ],
        position: PullDownMenuPosition.automatic,
        buttonBuilder: widget.builder);
  }
}


