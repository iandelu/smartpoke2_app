import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

part 'product_models.freezed.dart';
part 'product_models.g.dart';

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(explicitToJson: true)
  const factory ProductModel({
    required String ean,
    required String name,
    String? amount,
    String? nutriscore,
    int? novaGroup,
    String? description,
    String? brand,
    String? ingredients,
    String? origin,
    String? preservation,
    String? picture,
    DateTime? lastUpdate,
    required Category category,
    String? keywords,
    Nutrients? nutrients,
    List<String>? tags,
    List<AllergenDto>? allergens,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

@freezed
class AllergenDto with _$AllergenDto {
  @JsonSerializable(explicitToJson: true)
  const factory AllergenDto({
    required String name,
    required String lan,
  }) = _AllergenDto;

  factory AllergenDto.fromJson(Map<String, dynamic> json) => _$AllergenDtoFromJson(json);
}

@freezed
class Category with _$Category {
  @JsonSerializable(explicitToJson: true)
  const factory Category({
    required int id,
    required String name,
    String? lan,
    String? emoji,
    List<RecipeModel>? recipes,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}