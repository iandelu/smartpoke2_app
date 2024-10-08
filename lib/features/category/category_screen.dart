import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/category/providers/catgories_provider.dart';
import 'package:meal_ai/features/recipes/providers/recipe_from_url_provider/recipe_from_url_provider.dart';
import 'package:meal_ai/features/recipes/services/api_services/recipe_service.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes/widgets/recipe_card.dart';
import 'package:rxdart/rxdart.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  final String categoryName;
  static const String name = 'category-screen';

  CategoryScreen({required this.categoryName});

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends ConsumerState<CategoryScreen> {
  late final CategoryModel category;
  final RecipeApiService _recipeService = RecipeApiService();
  final BehaviorSubject<bool> isLoadingStream = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<List<RecipeModel>> debouncedRecipes = BehaviorSubject<List<RecipeModel>>.seeded([]);
  List<RecipeModel> initialRecipes = [];

  @override
  void initState() {
    category = ref.read(categoryProvider).recipeCategories.firstWhere((element) => element.name == widget.categoryName);
    super.initState();
    fetchRecipes();
  }

  @override
  void dispose() {
    isLoadingStream.close();
    debouncedRecipes.close();
    super.dispose();
  }

  Future<void> fetchRecipes() async {
    try {
      isLoadingStream.add(true);
      final recipes = await _recipeService.fetchRecipes('', category: [category]);
      setState(() {
        initialRecipes = recipes;
      });
      debouncedRecipes.add(recipes);
    } catch (e) {
      // Handle errors here if necessary
    } finally {
      isLoadingStream.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${category.name} ${category.emoji} Recipes'),
      ),
      body: StreamBuilder<bool>(
        stream: isLoadingStream.stream,
        initialData: false,
        builder: (context, isLoadingSnapshot) {
          final isLoading = isLoadingSnapshot.data ?? false;

          return Stack(
            children: [
              StreamBuilder(
                initialData: initialRecipes,
                stream: debouncedRecipes.stream,
                builder: (context, snapshot) {
                  final List<RecipeModel> recipes = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Dismissible(
                          key: Key(recipe.id.toString()),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.green,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: const Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            ref.read(recipeFromUrlProvider.notifier).addRecipeFromUrlToHive(recipe: recipe);
                            setState(() {
                              initialRecipes.remove(recipe);
                            });
                            debouncedRecipes.add(List.from(initialRecipes));
                          },
                          child: RecipeCard(
                            recipe: recipe,
                            onTap: () => Navigator.pop(context, recipe.id),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}