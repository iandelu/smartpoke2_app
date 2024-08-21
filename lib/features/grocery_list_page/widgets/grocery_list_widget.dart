import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';
import 'package:meal_ai/features/grocery_list_page/providers/grocery_list_provider/grocery_list_provider.dart';
import 'package:meal_ai/features/product/search/product_search_delegate.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

import 'grocery_detail_sheet.dart';

class GroceryListWidget extends StatefulHookConsumerWidget {
  const GroceryListWidget({
    super.key,
  });

  @override
  ConsumerState<GroceryListWidget> createState() => _GroceryListWidgetState();
}

class _GroceryListWidgetState extends ConsumerState<GroceryListWidget> {

  void _showBottomSheet(BuildContext context, GroceryModel grocery, int index, Function(int, GroceryModel) onUpdateGrocery, List<UnitOfMeasure> unitOfMeasures) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GroceryDetailSheet(
          grocery: grocery,
          index: index,
          onUpdateGrocery: onUpdateGrocery,
          unitOfMeasures: unitOfMeasures,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final groceryList = ref.watch(groceryListProvider);
    final groceryMethods = ref.read(groceryListProvider.notifier);
    final groupedGroceries = <String, List<GroceryModel>>{};

    final onUpdateGrocery = (index, grocery) {
      groceryMethods.updateGrocery(item: grocery, key: grocery.key);
    };

    final unitOfMeasures = [
      UnitOfMeasure(id: 1, name: 'g'),
      UnitOfMeasure(id: 2, name: 'kg'),
      UnitOfMeasure(id: 3, name: 'L'),
    ];



    for (var grocery in groceryList) {
      final category = grocery.groceryItem.product?.category?.name ?? 'Otros';
      if (groupedGroceries.containsKey(category)) {
        groupedGroceries[category]!.add(grocery);
      } else {
        groupedGroceries[category] = [grocery];
      }
    }

    int selectedCount = groceryList.where((item) => item.isChecked).length;
    double progress = groceryList.isEmpty
        ? 0
        : selectedCount / groceryList.length;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSearch(
            context: context,
            delegate: ProductSearchDelegate(ref, initialProducts: []),
          );
        },
        child: const Icon(Icons.search),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: groupedGroceries.keys.length,
                itemBuilder: (context, index) {
                  final category = groupedGroceries.keys.elementAt(index);
                  final items = groupedGroceries[category]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          category,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ...items.map((grocery) {
                        final item = grocery.groceryItem;
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          decoration: BoxDecoration(
                            color: grocery.isChecked
                                ? accentTeal1
                                : accentTeal2,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            onTap: () {
                              _showBottomSheet(context, grocery, index, onUpdateGrocery, unitOfMeasures);
                            },
                            leading: Checkbox(
                              value: grocery.isChecked,
                              onChanged: (val) {
                                setState(() {
                                  FocusScope.of(context).unfocus();

                                  final updatedGrocery = grocery
                                      .copyWith(isChecked: val!);
                                  grocery = updatedGrocery;
                                  groceryMethods.updateGrocery(
                                      item: grocery,
                                      key: grocery.key);
                                });
                              },
                            ),
                            title: Text(
                              '${item.amount}${item.unitOfMeasure?.name ?? ''} -${item.product?.description ?? item.product?.name ?? 'Unknown'}',
                              style: TextStyle(
                                fontSize: 16,
                                decoration: grocery.isChecked
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: grocery.isChecked
                                    ? Colors.black54
                                    : Colors.black,
                              ),
                            ),
                            trailing: Text(
                                item.product?.category?.emoji ?? '🍽️',
                              style: AppTextStyles().emojiCategory,
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
