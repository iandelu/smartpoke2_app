// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroceryModelImpl _$$GroceryModelImplFromJson(Map json) => _$GroceryModelImpl(
      groceryItem: RecipeProduct.fromJson(
          Map<String, dynamic>.from(json['groceryItem'] as Map)),
      isChecked: json['isChecked'] as bool,
      key: json['key'],
    );

Map<String, dynamic> _$$GroceryModelImplToJson(_$GroceryModelImpl instance) =>
    <String, dynamic>{
      'groceryItem': instance.groceryItem.toJson(),
      'isChecked': instance.isChecked,
      'key': instance.key,
    };
