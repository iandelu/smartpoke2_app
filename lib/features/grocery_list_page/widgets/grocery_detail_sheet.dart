import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class GroceryDetailSheet extends StatefulWidget {
  final GroceryModel grocery;
  final int index;
  final void Function(int, GroceryModel) onUpdateGrocery;
  final List<UnitOfMeasure> unitOfMeasures;

  const GroceryDetailSheet({
    required this.grocery,
    required this.index,
    required this.onUpdateGrocery,
    required this.unitOfMeasures,
    Key? key,
  }) : super(key: key);

  @override
  _GroceryDetailSheetState createState() => _GroceryDetailSheetState();
}

class _GroceryDetailSheetState extends State<GroceryDetailSheet> {
  late TextEditingController _amountController;
  late TextEditingController _nameController;
  UnitOfMeasure? selectedUnit;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.grocery.groceryItem.amount.toString());
    _nameController = TextEditingController(text: widget.grocery.groceryItem.product?.description ?? widget.grocery.groceryItem.product?.name);
    selectedUnit = widget.grocery.groceryItem.unitOfMeasure;
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
                  final updatedProduct = widget.grocery.groceryItem.copyWith(
                    amount: double.tryParse(_amountController.text) ?? widget.grocery.groceryItem.amount,
                    product: widget.grocery.groceryItem.product?.copyWith(name: _nameController.text),
                    unitOfMeasure: selectedUnit,
                  );

                  final updatedGrocery = GroceryModel(
                    groceryItem: updatedProduct,
                    isChecked: widget.grocery.isChecked,
                    key: widget.grocery.key,
                  );

                  widget.onUpdateGrocery(widget.index, updatedGrocery);
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
                    labelText: widget.grocery.groceryItem.unitOfMeasure?.name ?? 'Unidad',
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
