import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';
import 'package:meal_ai/features/grocery_list_page/providers/grocery_list_provider/grocery_list_provider.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';
import 'package:meal_ai/features/product/providers/product_provider.dart';
import 'package:meal_ai/features/product/providers/search_product_provider.dart';
import 'package:meal_ai/features/product/widgets/product_card.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class ProductSearchDelegate extends SearchDelegate {
  List<ProductModel> initialProducts;
  final WidgetRef ref;
  StreamController<List<ProductModel>> debouncedRecipes = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;


  ProductSearchDelegate(this.ref, {required this.initialProducts}) : super(
    searchFieldLabel: 'Search products',
  );

  void clearStreams() {
    debouncedRecipes.close();
    isLoadingStream.close();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);

    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 900), () async {
      final products = await ref.read(searchedProductsNotifier.notifier).searchProducts(query);
      initialProducts = products;
      debouncedRecipes.add(products);
      isLoadingStream.add(false);
    });
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
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
    return StreamBuilder<bool>(
      stream: isLoadingStream.stream,
      initialData: false,
      builder: (context, isLoadingSnapshot) {
        final isLoading = isLoadingSnapshot.data ?? false;

        return Stack(
          children: [
            StreamBuilder(
              initialData: initialProducts,
              stream: debouncedRecipes.stream,
              builder: (context, snapshot) {
                final List<ProductModel> products = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Dismissible(
                          key: Key(product.id.toString()),
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
                            GroceryModel newGrocery = GroceryModel(
                              groceryItem: RecipeProduct(
                                id: null,
                                product: product,
                                amount: 1,
                                unitOfMeasure: null
                              ),
                              isChecked: false,
                              key: null,
                            );
                            ref.read(groceryListProvider.notifier).addGrocery(newGrocery);
                            initialProducts.remove(product);
                          },
                          child: ProductCard(
                            product: product,
                            onTap: () => close(context, product.id),
                          ),
                        )

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
    );
  }
}