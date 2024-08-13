
import 'dart:typed_data';

import 'package:contraflutterkit/model/item_basic_info.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

ItemBasicInfo recipeToBasicInfo(RecipeModel recipe) {
  return ItemBasicInfo(
    id: recipe.id,
    name: recipe.name,
    extra: recipe.ratings.toStringAsFixed(2),
    extraWidget: const Icon(
      Icons.star,
      color: pink_salomn,
      size: 16,
    ),
    by: 'SmartPoke',
    bgColor: recipe.id % 2 == 0 ? flamingo : carribean_green,
    image: recipe.imageFile ?? Uint8List(0),
  );
}