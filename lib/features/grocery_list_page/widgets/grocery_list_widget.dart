import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';
import 'package:meal_ai/core/provider/unit_of_measure_provider.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/core/widgets/expandable_text.dart';
import 'package:meal_ai/core/widgets/neu_buttons.dart';
import 'package:meal_ai/core/widgets/progress_bar.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/category/widgets/categories_horizontal_scroller.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';
import 'package:meal_ai/features/grocery_list_page/providers/grocery_list_provider/grocery_list_provider.dart';
import 'package:meal_ai/features/product/search/product_search_delegate.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

import 'recipe_product_edit_sheet.dart';

class GroceryListWidget extends StatefulHookConsumerWidget {
  const GroceryListWidget({
    super.key,
  });

  @override
  ConsumerState<GroceryListWidget> createState() => _GroceryListWidgetState();
}

class _GroceryListWidgetState extends ConsumerState<GroceryListWidget> {

  void _showBottomSheet(BuildContext context, GroceryModel grocery, int index, Function(int, RecipeProduct) onUpdateGrocery, List<UnitOfMeasure> unitOfMeasures) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return RecipeProductEditSheet(
          recipeProduct: grocery.groceryItem,
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

    onUpdateGrocery(index, product) {
      final grocery = groceryList[index].copyWith(groceryItem: product);
      groceryMethods.updateGrocery(item: grocery, key: grocery.key);
    }

    final unitOfMeasures = ref.read(unitOfMeasureProvider).units;

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
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: context.primaryColor,
          shape: BoxShape.circle,
        ),
        child: NeuIconButton(
          onPressed: showSearhProduct,
          borderRadius: BorderRadius.circular(BorderRadiusSizes.xxl),
          icon: const Icon(
            Icons.search,
            size: PaddingSizes.xl,
            color: black1,
          ),
          enableAnimation: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NeuProgressBarIndicator(progress: progress),
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
                          style: headline5,
                        ),
                      ),
                      ...items.map((grocery) {
                        final item = grocery.groceryItem;
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          decoration: BoxDecoration(
                            boxShadow: [shadowMediumBrut],
                            border: Border.all(
                              color: black1,
                              width: 2.0,
                            ),
                            color: grocery.isChecked
                                ? accentTeal1
                                : accentTeal2,
                          ),
                          child: Dismissible(
                            key: Key(grocery.key.toString()),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) {
                              onDismissedItem(grocery, selectedCount, groupedGroceries, category, groceryList, index, groceryMethods, context);
                            },
                            background: Container(
                              color: Colors.red,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: ListTile(
                              onTap: () {
                                _showBottomSheet(context, grocery, index, onUpdateGrocery, unitOfMeasures);
                              },
                              leading: Checkbox(
                                checkColor: black1,
                                activeColor: accentCoral1,
                                value: grocery.isChecked,
                                onChanged: (val) {
                                  grocery = onUpdatedItem(context, grocery, val, groceryMethods);
                                },
                              ),
                              title: ExpandableTextWidget(
                                text: '${item.amount}${item.unitOfMeasure?.name ?? ''} - ${item.product?.description}',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  decoration: grocery.isChecked
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: grocery.isChecked
                                      ? Colors.black54
                                      : Colors.black,
                                ),
                              ),
                              trailing: Container(
                                height: 32,
                                width: 32,
                                child: CategoryItem(
                                  CategoryModel(
                                    name: item.product?.category?.name ?? '',
                                    emoji: item.product?.category?.emoji ?? '',
                                  ),
                                ),
                              ),
                            ),
                          )
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

  GroceryModel onUpdatedItem(BuildContext context, GroceryModel grocery, bool? val, GroceryList groceryMethods) {
    setState(() {
      FocusScope.of(context).unfocus();
      final updatedGrocery = grocery.copyWith(isChecked: val!);
      grocery = updatedGrocery;
      groceryMethods.updateGrocery(
          item: grocery, key: grocery.key);
    });
    return grocery;
  }

  void onDismissedItem(GroceryModel grocery, int selectedCount, Map<String, List<GroceryModel>> groupedGroceries, String category, List<GroceryModel> groceryList, int index, GroceryList groceryMethods, BuildContext context) {
    setState(() {
      deleteGroceryItem(grocery, selectedCount, groupedGroceries, category, groceryList, index, groceryMethods);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Producto eliminado'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void deleteGroceryItem(GroceryModel grocery, int selectedCount, Map<String, List<GroceryModel>> groupedGroceries, String category, List<GroceryModel> groceryList, int index, GroceryList groceryMethods) {
    if (grocery.isChecked) {
      selectedCount--;
    }
    groceryList.removeAt(index);

    if(groupedGroceries[category]!.length == 1) {
      groupedGroceries.remove(category);
    } else {
      groupedGroceries[category]!.remove(grocery);
    }
    groceryList.removeAt(index);
    groceryMethods.deleteGrocery(key: grocery.key);
  }



  void showSearhProduct() {
    showSearch(
      context: context,
      delegate: ProductSearchDelegate(ref, initialProducts: []),
    ).then((ean) {
      if(ean == null) return;
      context.push('/product/$ean');
    });
  }

}