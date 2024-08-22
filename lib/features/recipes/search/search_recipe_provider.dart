import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:meal_ai/features/category/models/category_models.dart';
import 'dart:convert';
import 'dart:async';

import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/services/api_services/recipe_service.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');


final searchedRecipesNotifier = StateNotifierProvider<SearchedRecipesNotifier, List<RecipeModel>>((ref) {
  return SearchedRecipesNotifier(RecipeApiService(), ref);
});


class SearchedRecipesNotifier extends StateNotifier<List<RecipeModel>> {
  List<CategoryModel> _categories = [];
  int? _rating;
  int? _time;
  String? _difficulty;
  final RecipeApiService recipeApiClient;
  final Ref ref;

  SearchedRecipesNotifier(this.recipeApiClient, this.ref) : super([]);

  void setFilters(List<CategoryModel> categories, int? rating, int? time, String? difficulty) {
    _categories = categories;
    _rating = rating;
    _time = time;
    _difficulty = difficulty;
  }

  void clearFilters() {
    _categories = [];
    _rating = null;
    _time = null;
    _difficulty = null;
  }

  Map<String, dynamic> getFilters() {
    return {
      'categories': _categories,
      'rating': _rating,
      'time': _time,
      'difficulty': _difficulty,
    };
  }

  Future<List<RecipeModel>> searchRecipes(String query) async {
    try {
      List<RecipeModel> recipes = await recipeApiClient.fetchRecipes(query, category: _categories, rating: _rating, time: _time, difficulty: _difficulty);
      ref.read(searchQueryProvider.notifier).update((state) => query);
      state = recipes;

    } on Exception catch (e) {
      state = [];
    }

    return state;
  }
}
