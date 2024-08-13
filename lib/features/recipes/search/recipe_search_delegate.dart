import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/search/search_recipe_provider.dart';
import 'package:meal_ai/features/recipes/widgets/filter_dialog.dart';

class RecipeSearchDelegate extends SearchDelegate {
  final WidgetRef ref;
  List<RecipeModel> initialRecipes;
  StreamController<List<RecipeModel>> debouncedRecipes = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  RecipeSearchDelegate(this.ref, {required this.initialRecipes}) : super(
    searchFieldLabel: 'Search recipes',
  );

  void clearStreams() {
    debouncedRecipes.close();
    isLoadingStream.close();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);

    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 900), () async {
      final recipes = await ref.read(searchedRecipesNotifier.notifier).searchRecipes(query);
      initialRecipes = recipes;
      debouncedRecipes.add(recipes);
      isLoadingStream.add(false);
    });
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
      IconButton(
        icon: const Icon(Icons.filter_list),
        onPressed: () async {
          final filters = await showDialog<Map<String, dynamic>>(
            context: context,
            builder: (context) {
              return FilterDialog();
            },
          );

          if (filters != null) {
            ref.read(searchedRecipesNotifier.notifier).setFilters(
              filters['categories'],
              filters['rating'],
              filters['time'],
              filters['difficulty'],
            );
            ref.read(searchedRecipesNotifier.notifier).searchRecipes(query);
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        clearStreams();
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder(
      initialData: initialRecipes,
      stream: debouncedRecipes.stream,
      builder: (context, snapshot) {
        final List<RecipeModel> recipes = snapshot.data ?? [];
        return ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return ListTile(
              title: Text(recipe.name),
            );
          },
        );
      },
    );
  }
}