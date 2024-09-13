import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

part 'grocery_model.freezed.dart';
part 'grocery_model.g.dart';

@freezed
class GroceryModel with _$GroceryModel {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory GroceryModel({
    required RecipeProduct groceryItem,
    required bool isChecked,
    required dynamic key,
  }) = _GroceryModel;

  factory GroceryModel.fromJson(Map<String, dynamic> json) =>
      _$GroceryModelFromJson(json);
}
