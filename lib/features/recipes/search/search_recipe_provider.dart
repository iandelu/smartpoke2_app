import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/services/api_services/recipe_service.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');


final searchedRecipesNotifier = StateNotifierProvider<SearchedRecipesNotifier, List<RecipeModel>>((ref) {
  return SearchedRecipesNotifier(RecipeApiService(), ref);
});


class SearchedRecipesNotifier extends StateNotifier<List<RecipeModel>> {
  List<String> _categories = [];
  int? _rating;
  int? _time;
  String? _difficulty;
  final RecipeApiService recipeApiClient;
  final Ref ref;

  SearchedRecipesNotifier(this.recipeApiClient, this.ref) : super([]);

  void setFilters(List<String> categories, int? rating, int? time, String? difficulty) {
    _categories = categories;
    _rating = rating;
    _time = time;
    _difficulty = difficulty;
  }

  Future<List<RecipeModel>> searchRecipes(String query) async {
    List<RecipeModel> recipes = await recipeApiClient.fetchRecipes(query, category: _categories, rating: _rating, time: _time, difficulty: _difficulty);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = recipes;
    return state;
  }
}
