import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class RecipeProductEditSheet extends StatefulWidget {
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

class _RecipeProductEditSheetState extends State<RecipeProductEditSheet> {
  late TextEditingController _amountController;
  late TextEditingController _nameController;
  UnitOfMeasure? selectedUnit;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.recipeProduct.amount.toString());
    _nameController = TextEditingController(text: widget.recipeProduct.ingredientName);
    selectedUnit = widget.recipeProduct.unitOfMeasure;
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
      color: colorScheme.background, // Color de fondo del BottomSheet
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.camera_alt, color: colorScheme.primary),
              Text('Detalles', style: textTheme.headlineMedium?.copyWith(color: colorScheme.onBackground)),
              TextButton(
                onPressed: () {
                  final updatedProduct = widget.recipeProduct.copyWith(
                    ingredientName: _nameController.text,
                    amount: double.tryParse(_amountController.text) ?? widget.recipeProduct.amount,
                    unitOfMeasure: selectedUnit,
                  );

                  widget.onUpdateGrocery(widget.index, updatedProduct);
                  Navigator.pop(context);
                },
                child: Text('Hecho', style: TextStyle(color: colorScheme.primary)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: colorScheme.surface,
              labelText: 'Nombre o Descripción',
              labelStyle: TextStyle(color: colorScheme.onSurface),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16), // Bordes redondeados
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colorScheme.surface,
                    labelText: 'Cantidad',
                    labelStyle: TextStyle(color: colorScheme.onSurface),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16), // Bordes redondeados
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: colorScheme.onSurface),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<UnitOfMeasure>(
                  value: selectedUnit,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colorScheme.surface,
                    labelText: widget.recipeProduct.unitOfMeasure?.name ?? 'Unidad',
                    labelStyle: TextStyle(color: colorScheme.onSurface),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16), // Bordes redondeados
                      borderSide: BorderSide.none,
                    ),
                  ),
                  dropdownColor: colorScheme.surface,
                  style: TextStyle(color: colorScheme.onSurface),
                  items: widget.unitOfMeasures.map((UnitOfMeasure unit) {
                    return DropdownMenuItem<UnitOfMeasure>(
                      value: unit,
                      child: Text("${unit.name ?? ''}", style: TextStyle(color: colorScheme.onSurface)),
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (double.tryParse(_amountController.text)! > 1) {
                      _amountController.text = (double.tryParse(_amountController.text)! - 1).toString();
                    }
                  });
                },
                icon: Icon(Icons.remove_circle_outline, color: colorScheme.primary),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _amountController.text = (double.tryParse(_amountController.text)! + 1).toString();
                  });
                },
                icon: Icon(Icons.add_circle_outline, color: colorScheme.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}