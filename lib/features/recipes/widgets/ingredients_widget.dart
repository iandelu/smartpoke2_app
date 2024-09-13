import 'package:flutter/material.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class IngredientsPage extends StatefulWidget {
  final List<RecipeProduct> ingredients;
  final double factor;

  const IngredientsPage({Key? key, required this.ingredients, required this.factor}) : super(key: key);

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void didUpdateWidget(IngredientsPage oldWidget) {
    if (oldWidget.factor != widget.factor) {
      _animationController
        ..reset()
        ..forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Column(
        children: <Widget>[
          for (var ingredient in widget.ingredients)
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (ingredient.amount != 0)

                        Text(
                          "${double.parse((ingredient.amount * widget.factor).toStringAsFixed(2))} ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      if (ingredient.unitOfMeasure != null && ingredient.unitOfMeasure!.name != null)
                        Text(
                            "${ingredient.unitOfMeasure!.name} ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      Expanded(
                        child: Text(
                          ingredient.product!.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
