import 'dart:convert';

import 'package:meal_ai/config/connections/smartpoke_client.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class UnitOfMeasureService {

  Future<List<UnitOfMeasure>> fetchUnitsOfMeasure() async {
    final response = await smartPokeClient
    .get('unit_of_measure');

    if (response.statusCode == 200) {
      List<dynamic> unitOfMeasureJson = response.data;
      return unitOfMeasureJson
              .map((json) => UnitOfMeasure.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load units of measure');
    }
  }
}
