import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/human_formats.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/core/widgets/expandable_text.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/widgets/categories_list_widget.dart';
import 'package:meal_ai/features/recipes/widgets/ingredients_widget.dart';
import 'package:meal_ai/features/recipes/widgets/steps_ingredients.dart';
import 'package:meal_ai/features/recipes/widgets/yields_counter.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetail extends ConsumerStatefulWidget {

  final RecipeModel recipe;

  const RecipeDetail({
    super.key,
    required this.recipe,
  });

  static const String name = 'recipe-detail-screen';



  @override
  RecipeDetailState createState() => RecipeDetailState();
}

class RecipeDetailState extends ConsumerState<RecipeDetail> {
  late RecipeModel? recipe;
  late var favorite = false;
  double _factor = 1.0;
  late Color color = Theme.of(context).colorScheme.secondary;
  late Color colorSecondary = Theme.of(context).colorScheme.primary;

  @override
  void initState() {
    super.initState();
  }

  void _updateFactor(int peopleCount) {
    setState(() {
      _factor = peopleCount/recipe!.yields;
    });
  }

  Widget buildRecipeImage() {
    return SliverAppBar(
      expandedHeight: 350,
      flexibleSpace: GestureDetector(
        onLongPress: () => _launchURL(recipe!.source),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              //If image is null and also url is null, then use default image
              image: recipe?.imageFile != null
                  ? MemoryImage(recipe!.imageFile!)
                  : recipe?.pictureUrl != null
                  ? NetworkImage(recipe!.pictureUrl)
                  : AssetImage('images/savor.png') as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: IconButton(
          icon: const Icon(
           Icons.close,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      leadingWidth: 50,
      actions: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: IconButton(
            icon: Icon(
              favorite ? Icons.favorite : Icons.favorite_border,
              color: favorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                favorite = !favorite; // Alterna el estado de 'favorite' al presionar el botón
              });
            },
          ),
        )
      ],
    );
  }

  Widget buildRecipeDetails() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(
          left: PaddingSizes.lg,
          right: PaddingSizes.lg,
          top: PaddingSizes.xs,
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(BorderRadiusSizes.md),
              topLeft: Radius.circular(BorderRadiusSizes.md),
            ),
            color: Theme.of(context).colorScheme.surface
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: PaddingSizes.md,
                ),
                ExpandableTextWidget(
                  text: recipe!.name,
                  style: headline1,
                  maxLines: 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: YieldsCounter(
                    count: (_factor * recipe!.yields).round(),
                    onCountChanged: (newCount) {
                      _updateFactor(newCount);
                    },
                    buttonColor: color,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: PaddingSizes.md,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                createIconText(
                  Icons.signal_cellular_alt,
                  recipe!.difficulty.toString(),
                  accentTeal1,
                ),
                createIconText(
                  Icons.timer,
                  HumanFormats.timeToString(recipe!.totalTime),
                  accentTeal1,
                ),
                createIconText(
                  Icons.star,
                  recipe!.ratings.toString(),
                  accentTeal1,
                ),
              ],
            ),
            const SizedBox(
              height: PaddingSizes.md,
            ),
            const Text(
              "Description",
              style: headline5,
            ),
            ExpandableTextWidget(text: recipe!.description,
              style: const TextStyle(
                  color: black2,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
              maxLines: 3,
            ),
            const SizedBox(
              height: PaddingSizes.md,
            ),
            CategoriesWidget(categories: recipe!.categories,),
            const SizedBox(
              height: PaddingSizes.md,
            ),
            const Text(
              "Ingredientes",
              style: headline5,
            ),
            IngredientsPage(ingredients: recipe!.recipeProducts, factor: _factor),
            const SizedBox(
              height: PaddingSizes.md,
            ),
            const Text(
              "Preparacion",
              style: headline5,
            ),
            StepsRecipeList(recipeSteps: recipe!.recipeSteps),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return GestureDetector(
      child: Container(
        height: PaddingSizes.md,
        padding: const EdgeInsets.only(
          top: PaddingSizes.md,
          bottom: PaddingSizes.md,
          left: PaddingSizes.md,
          right: PaddingSizes.md,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusSizes.sm),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: BrutButton(
          color: colorSecondary,
          text: 'Start cooking',
          onPressed: () =>  {}/*context.push('/recipe-stories', extra: recipe!.recipeSteps)*/,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    recipe = widget.recipe;

    if (recipe == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildRecipeImage(),
          buildRecipeDetails(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}


_launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }

}

Widget createIconText(IconData icon, String text, Color iconColor) {
  return Row(
    children: [
      Icon(
        icon,
        color: iconColor,
      ),
      const SizedBox(width: PaddingSizes.xxxs),
      Text(
        text,
        style: bodyText2
      ),
    ],
  );
}