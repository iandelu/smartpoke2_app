import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/recipes/screens/my_recipes_page_body.dart';
import 'package:meal_ai/features/recipes/widgets/add_recipe_menu.dart';

class RecipesPage extends ConsumerStatefulWidget {
  const RecipesPage({super.key});

  @override
  ConsumerState<RecipesPage> createState() => _RecipesState();
}

class _RecipesState extends ConsumerState<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MyRecipesPageBody(),
      floatingActionButton: AddRecipeMenu(
        builder: (context, showMenu) => Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: context.primaryColor,
            shape: BoxShape.circle,
          ),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: showMenu,
            child: const Icon(
              Icons.add,
              size: PaddingSizes.xl,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
