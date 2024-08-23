import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';
import 'package:meal_ai/features/product/providers/product_provider.dart';
import 'package:meal_ai/features/product/search/product_search_delegate.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/widgets/buttons.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';
import 'package:meal_ai/features/product/search/product_search_delegate.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeProductEditSheet extends ConsumerStatefulWidget {
  final RecipeProduct recipeProduct;
  final int index;
  final void Function(int, RecipeProduct) onUpdateGrocery;
  final List<UnitOfMeasure> unitOfMeasures;

  const RecipeProductEditSheet({
    required this.recipeProduct,
    required this.index,
    required this.onUpdateGrocery,
    required this.unitOfMeasures,
    Key? key,
  }) : super(key: key);

  @override
  _RecipeProductEditSheetState createState() => _RecipeProductEditSheetState();
}
class _RecipeProductEditSheetState extends ConsumerState<RecipeProductEditSheet> {
  late TextEditingController _amountController;
  late TextEditingController _nameController;
  UnitOfMeasure? selectedUnit;
  ProductModel? selectedProduct;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.recipeProduct.amount.toString());
    _nameController = TextEditingController(text: widget.recipeProduct.ingredientName);
    selectedUnit = widget.recipeProduct.unitOfMeasure;
    selectedProduct = widget.recipeProduct.product;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BrutIconButton(
                icon: Icon(Icons.fastfood_rounded),
                buttonColor: accentPurple1,
                onPressed: () async  {
                  searchAndSaveProduct(context);
                },
              ),
              Text('Editar Producto', style: headline4),
              TextButton(
                onPressed: () => onSave(context),
                child: Text('Hecho', style: headline5.copyWith(color: colorScheme.primary)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Nombre del producto', style: headline6),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              enabled: false,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const  BorderSide(
                  color: black1,
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.grey.shade600),
            ),
            style: TextStyle(color: black1, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: Text('Cantidad', style: headline6),
              ),
              Expanded(
                child: Text('Unidad', style: headline6),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0 ,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    filled: true,
                    fillColor:  Colors.white,
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: black1, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<UnitOfMeasure>(
                  value: selectedUnit,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0 ,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    filled: true,
                    fillColor:  Colors.white,
                    hintStyle: TextStyle(color: black1, fontWeight: FontWeight.w500),
                  ),
                  dropdownColor: Colors.white,
                  style: TextStyle(color: colorScheme.onSurface),
                  items: widget.unitOfMeasures.map((UnitOfMeasure unit) {
                    return DropdownMenuItem<UnitOfMeasure>(
                      value: unit,
                      child: Text("${unit.name ?? ''}", style: TextStyle(color: black1, fontWeight: FontWeight.w500)),
                    );
                  }).toList(),
                  onChanged: (UnitOfMeasure? newUnit) {
                    setState(() {
                      selectedUnit = newUnit;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void searchAndSaveProduct(BuildContext context) {
    showSearch(
      context: context,
      delegate: ProductSearchDelegate(ref, initialProducts: []),
    ).then((ean) async {
      if (ean != null) {
         selectedProduct  = await ref.read(productProviderProvider.notifier).getProductFromEan(ean: ean);
        _nameController.text = selectedProduct!.description ?? selectedProduct!.name;
      }
    });
  }

  void onSave(BuildContext context, ) {
    final updatedProduct = widget.recipeProduct.copyWith(
      product: selectedProduct,
      ingredientName: _nameController.text,
      amount: double.tryParse(_amountController.text) ?? widget.recipeProduct.amount,
      unitOfMeasure: selectedUnit,
    );

    widget.onUpdateGrocery(widget.index, updatedProduct);
    Navigator.pop(context);
  }
}