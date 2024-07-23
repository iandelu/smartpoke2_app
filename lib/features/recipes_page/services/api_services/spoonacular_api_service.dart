import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meal_ai/core/utils/helper_methods.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes_page/services/local_services/spoonacular_hive_service.dart';

class SpoonacularApiService {
  final SpoonacularHiveService hiveService = SpoonacularHiveService();

  Future<RecipeModel> getRecipeFromUrl({required String url}) async {
    final apiUrl =
        Uri.parse('http://10.0.2.2:5000/scrape');

    try {
      final response = await http.post(
        apiUrl,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'url': url, 'wild' : true}),
      );

      if (response.statusCode == 200) {
        // Decode the response body with UTF-8
        var decodedResponse = utf8.decode(response.bodyBytes);

        // Parse the decoded string to JSON
        final Map<String, dynamic> jsonResponse = jsonDecode(decodedResponse);
        final result = RecipeModel.fromJson(parser(jsonResponse));
        return result;
      } else {
        logger.d(response.statusCode);
        throw Exception('Something went wrong');
      }
    } catch (e, st) {
      logger.d('Error', error: e, stackTrace: st);
      throw Exception('Error: $e');
    }
  }
}
