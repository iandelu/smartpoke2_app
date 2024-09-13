import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/category/services/api_services/smartpoke_api_service.dart';

class CategoryState {
  final List<CategoryModel> recipeCategories;
  final List<CategoryModel> productCategories;
  final bool isLoading;
  final String? errorMessage;

  CategoryState({
    this.recipeCategories = const [],
    this.productCategories = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  CategoryState copyWith({
    List<CategoryModel>? recipeCategories,
    List<CategoryModel>? productCategories,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CategoryState(
      recipeCategories: recipeCategories ?? this.recipeCategories,
      productCategories: productCategories ?? this.productCategories,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class CategoryNotifier extends StateNotifier<CategoryState> {
  final SmartpokeCategoryApiService _apiService;

  CategoryNotifier(this._apiService) : super(CategoryState());

  Future<void> loadCategories() async {
    try {
      state = state.copyWith(isLoading: true);
      final recipes = await _apiService.getRecipeCategories();
      final products = await _apiService.getProductCategories();
      state = CategoryState(
        recipeCategories: recipes,
        productCategories: products,
        isLoading: false,
      );
    } catch (e) {
      state = CategoryState(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}

final categoryProvider = StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  final apiService = SmartpokeCategoryApiService();
  final notifier = CategoryNotifier(apiService);
  notifier.loadCategories(); // Cargar categorías al iniciar
  return notifier;
});
