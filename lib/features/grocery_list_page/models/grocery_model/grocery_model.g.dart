// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroceryModelImpl _$$GroceryModelImplFromJson(Map<String, dynamic> json) =>
    _$GroceryModelImpl(
      groceryItem:
          RecipeProduct.fromJson(json['groceryItem'] as Map<String, dynamic>),
      isChecked: json['isChecked'] as bool,
      key: json['key'],
    );

Map<String, dynamic> _$$GroceryModelImplToJson(_$GroceryModelImpl instance) =>
    <String, dynamic>{
      'groceryItem': instance.groceryItem.toJson(),
      'isChecked': instance.isChecked,
      'key': instance.key,
    };
