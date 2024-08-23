import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/widgets/edit_recipe_widgets/text_field_section.dart';
import 'package:meal_ai/features/user/widgets/input_field.dart';

class StepsSection extends StatelessWidget {
  final List<RecipeStep> steps;
  final Function(int, RecipeStep) onStepChanged;
  final Function(int) onStepRemoved;
  final Function() onStepAdded;

  StepsSection({
    required this.steps,
    required this.onStepChanged,
    required this.onStepRemoved,
    required this.onStepAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Steps', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Column(
          children: steps.asMap().entries.map((entry) {
            final TextEditingController  controller = TextEditingController(text: entry.value.description);
            int index = entry.key;
            RecipeStep step = entry.value;
            return ListTile(
              leading: Text(step.position.toString(), style: headline3),
              title: Column(
                children: [
                  TextFieldSection(
                    label: '',
                    controller: controller,
                    maxLines: 3,
                  ),
                ],
              ),
              trailing: BrutIconButton(

                  icon: Icon(Icons.camera_alt),
                  onPressed: () {})
            );
          }).toList(),
        ),
        TextButton(
          onPressed: onStepAdded,
          child: Text('+ Step'),
        ),
      ],
    );
  }
}