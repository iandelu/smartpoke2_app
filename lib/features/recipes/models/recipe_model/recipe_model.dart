import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/core/utils/image_utils.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/product/models/product_model/product_models.dart';
import 'package:meal_ai/features/user/models/user_models.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeModel({
    required int id,
    required String name,
    required String description,
    required int totalTime,
    required double price,
    required int yields,
    required String pictureUrl,
    required String source,
    required String lan,
    required double ratings,
    required int views,
    required String videoUrl,
    required DateTime lastUpdateDate,
    @Uint8ListConverter() required Uint8List imageFile,
    required String difficulty,
    required Nutrients nutrients,
    required List<RecipeStep> recipeSteps,
    required List<RecipeProduct> recipeProducts,
    required List<CategoryModel> categories,
    required UserModel user,
    @JsonKey(defaultValue: '') required String addTime,
    required
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);
}

@freezed
class Nutrients with _$Nutrients {
  @HiveType(typeId: 0)
  @JsonSerializable(explicitToJson: true)
  const factory Nutrients({
    @HiveField(0) required int amount,
    @HiveField(1) required int calories,
    @HiveField(2) required double fats,
    @HiveField(3) required double saturatedFats,
    @HiveField(4) required double cholesterol,
    @HiveField(5) required double cabs,
    @HiveField(6) required double fiber,
    @HiveField(7) required double protein,
    @HiveField(8) required double salt,
    @HiveField(9) required double alcohol,
    @HiveField(10) required double water,
    @HiveField(11) required double caffeine,
    @HiveField(12) required double sugars,
    @HiveField(13) required double calcium,
    @HiveField(14) required double iron,
    @HiveField(15) required double magnesium,
    @HiveField(16) required double phosphorus,
    @HiveField(17) required double potassium,
    @HiveField(18) required double sodium,
    @HiveField(19) required double zinc,
    @HiveField(20) required double copper,
    @HiveField(21) required double retinol,
    @HiveField(22) required double vitaminA,
    @HiveField(23) required double vitaminE,
    @HiveField(24) required double vitaminD,
    @HiveField(25) required double vitaminC,
    @HiveField(26) required double vitaminB6,
    @HiveField(27) required double vitaminB12,
    @HiveField(28) required double vitaminK,
    @HiveField(29) required double thiamin,
    @HiveField(30) required double niacin,
  }) = _Nutrients;

  factory Nutrients.fromJson(Map<String, dynamic> json) => _$NutrientsFromJson(json);
}

@freezed
class RecipeStep with _$RecipeStep {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeStep({
    required int id,
    required String description,
    required int position,
    required int time,
    required String picture,
  }) = _RecipeStep;

  factory RecipeStep.fromJson(Map<String, dynamic> json) => _$RecipeStepFromJson(json);
}

@freezed
class RecipeProduct with _$RecipeProduct {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeProduct({
    required int id,
    required double amount,
    required String text,
    required String ingredientName,
    required UnitOfMeasure unitOfMeasure,
    required ProductModel product,
  }) = _RecipeProduct;

  factory RecipeProduct.fromJson(Map<String, dynamic> json) => _$RecipeProductFromJson(json);
}

@freezed
class UnitOfMeasure with _$UnitOfMeasure {
  @JsonSerializable(explicitToJson: true)
  const factory UnitOfMeasure({
    required int id,
    required String name,
  }) = _UnitOfMeasure;

  factory UnitOfMeasure.fromJson(Map<String, dynamic> json) => _$UnitOfMeasureFromJson(json);
}

