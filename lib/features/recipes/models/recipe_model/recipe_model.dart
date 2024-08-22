import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/core/utils/image_utils.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';
import 'package:meal_ai/features/user/models/user/user_models.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeModel({
    required dynamic key,
    required int? id,
    required String name,
    @Default('No description available') String description,
    @Default(0) int totalTime,
    @Default(0.0) double price,
    @Default(1) int yields,
    @Default('') String pictureUrl,
    @Default('Unknown') String source,
    @Default('en') String lan,
    @Default(5.0) double ratings,
    @Default(0) int views,
    String? videoUrl,
    DateTime? lastUpdateDate,
    @Uint8ListConverter() Uint8List? imageFile,
    @Default('easy') String difficulty,
    @Default(Nutrients()) Nutrients nutrients,
    @Default([]) List<RecipeStep> recipeSteps,
    @Default([]) List<RecipeProduct> recipeProducts,
    @Default([]) List<CategoryModel> categories,
    UserModel? user,
    @Default('') String addTime,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);
}

@freezed
class Nutrients with _$Nutrients {
  @HiveType(typeId: 0)
  @JsonSerializable(explicitToJson: true)
  const factory Nutrients({
    @HiveField(0) @Default(0) int amount,
    @HiveField(1) @Default(0) int calories,
    @HiveField(2) @Default(0.0) double fats,
    @HiveField(3) @Default(0.0) double saturatedFats,
    @HiveField(4) @Default(0.0) double cholesterol,
    @HiveField(5) @Default(0.0) double cabs,
    @HiveField(6) @Default(0.0) double fiber,
    @HiveField(7) @Default(0.0) double protein,
    @HiveField(8) @Default(0.0) double salt,
    @HiveField(9) @Default(0.0) double alcohol,
    @HiveField(10) @Default(0.0) double water,
    @HiveField(11) @Default(0.0) double caffeine,
    @HiveField(12) @Default(0.0) double sugars,
    @HiveField(13) @Default(0.0) double calcium,
    @HiveField(14) @Default(0.0) double iron,
    @HiveField(15) @Default(0.0) double magnesium,
    @HiveField(16) @Default(0.0) double phosphorus,
    @HiveField(17) @Default(0.0) double potassium,
    @HiveField(18) @Default(0.0) double sodium,
    @HiveField(19) @Default(0.0) double zinc,
    @HiveField(20) @Default(0.0) double copper,
    @HiveField(21) @Default(0.0) double retinol,
    @HiveField(22) @Default(0.0) double vitaminA,
    @HiveField(23) @Default(0.0) double vitaminE,
    @HiveField(24) @Default(0.0) double vitaminD,
    @HiveField(25) @Default(0.0) double vitaminC,
    @HiveField(26) @Default(0.0) double vitaminB6,
    @HiveField(27) @Default(0.0) double vitaminB12,
    @HiveField(28) @Default(0.0) double vitaminK,
    @HiveField(29) @Default(0.0) double thiamin,
    @HiveField(30) @Default(0.0) double niacin,
  }) = _Nutrients;

  factory Nutrients.fromJson(Map<String, dynamic> json) => _$NutrientsFromJson(json);
}

@freezed
class RecipeStep with _$RecipeStep {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeStep({
    required int id,
    @Default('No description available') String description,
    @Default(0) int position,
    @Default(0) int time,
    @Default('') String picture,
  }) = _RecipeStep;

  factory RecipeStep.fromJson(Map<String, dynamic> json) => _$RecipeStepFromJson(json);
}

@freezed
class RecipeProduct with _$RecipeProduct {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeProduct({
    required int? id,
    @Default(0.0) double amount,
    @Default('No text available') String text,
    @Default('Unknown ingredient') String ingredientName,
    UnitOfMeasure? unitOfMeasure,
    ProductModel? product,
  }) = _RecipeProduct;

  factory RecipeProduct.fromJson(Map<String, dynamic> json) => _$RecipeProductFromJson(json);
}

@freezed
class UnitOfMeasure with _$UnitOfMeasure {
  @JsonSerializable(explicitToJson: true)
  const factory UnitOfMeasure({
    required int id,
    String? name,
  }) = _UnitOfMeasure;

  factory UnitOfMeasure.fromJson(Map<String, dynamic> json) => _$UnitOfMeasureFromJson(json);
}
