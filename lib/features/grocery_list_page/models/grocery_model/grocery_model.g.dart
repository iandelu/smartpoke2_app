// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroceryModelImpl _$$GroceryModelImplFromJson(Map<String, dynamic> json) =>
    _$GroceryModelImpl(
      groceryName: json['groceryName'] as String,
      isChecked: json['isChecked'] as bool,
      key: json['key'],
    );

Map<String, dynamic> _$$GroceryModelImplToJson(_$GroceryModelImpl instance) =>
    <String, dynamic>{
      'groceryName': instance.groceryName,
      'isChecked': instance.isChecked,
      'key': instance.key,
    };
