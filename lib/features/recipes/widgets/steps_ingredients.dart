import 'package:flutter/material.dart';
import 'package:meal_ai/core/utils/human_formats.dart';
import 'package:meal_ai/core/widgets/expandable_text.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
class StepsRecipeList extends StatelessWidget {
  final List<RecipeStep> recipeSteps;

  const StepsRecipeList({super.key, required this.recipeSteps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var step in recipeSteps) Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      NumberCircleWidget(text: step.position.toString()),
                      step.time != 0
                          ? Text(
                        HumanFormats.timeToString(step.time),
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      children: [
                        ExpandableTextWidget(text: step.description),
                        if(step.picture != "no-image")
                          Image.network(step.picture)
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    );
  }
}

class NumberCircleWidget extends StatelessWidget {

  final String text;

  const NumberCircleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        width: 20,
        height: 20,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}