import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_models.freezed.dart';
part 'category_models.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  @JsonSerializable(explicitToJson: true)
  const factory CategoryModel({
    required String name,
    String? lan,
    @Default('🍽️')String emoji
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}