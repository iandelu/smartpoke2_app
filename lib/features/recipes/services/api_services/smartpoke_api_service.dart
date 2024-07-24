import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meal_ai/core/utils/helper_methods.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/services/local_services/smarpoke_hive_service.dart';

class SmartpokeRecipeApiService {
  final SmartPokeRecipeHiveService hiveService = SmartPokeRecipeHiveService();

  Future<RecipeModel> getRecipeFromUrl({required String url}) async {
    final apiUrl =
        Uri.parse('http://10.0.2.2:8082/api/recipes/from_url');

    try {
      final response = await http.post(
        apiUrl,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'url': url}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
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
