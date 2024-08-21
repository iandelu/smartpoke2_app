// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num?)?.toInt(),
      ean: json['ean'] as String?,
      name: json['name'] as String,
      amount: json['amount'] as String?,
      nutriscore: json['nutriscore'] as String?,
      novaGroup: (json['novaGroup'] as num?)?.toInt(),
      description: json['description'] as String?,
      brand: json['brand'] as String?,
      ingredients: json['ingredients'] as String?,
      origin: json['origin'] as String?,
      preservation: json['preservation'] as String?,
      picture: json['picture'] as String?,
      lastUpdate: json['lastUpdate'] == null
          ? null
          : DateTime.parse(json['lastUpdate'] as String),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      keywords: json['keywords'] as String?,
      nutrients: json['nutrients'] == null
          ? null
          : Nutrients.fromJson(json['nutrients'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      allergens: (json['allergens'] as List<dynamic>?)
          ?.map((e) => AllergenDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ean': instance.ean,
      'name': instance.name,
      'amount': instance.amount,
      'nutriscore': instance.nutriscore,
      'novaGroup': instance.novaGroup,
      'description': instance.description,
      'brand': instance.brand,
      'ingredients': instance.ingredients,
      'origin': instance.origin,
      'preservation': instance.preservation,
      'picture': instance.picture,
      'lastUpdate': instance.lastUpdate?.toIso8601String(),
      'category': instance.category?.toJson(),
      'keywords': instance.keywords,
      'nutrients': instance.nutrients?.toJson(),
      'tags': instance.tags,
      'allergens': instance.allergens?.map((e) => e.toJson()).toList(),
    };

_$AllergenDtoImpl _$$AllergenDtoImplFromJson(Map<String, dynamic> json) =>
    _$AllergenDtoImpl(
      name: json['name'] as String,
      lan: json['lan'] as String,
    );

Map<String, dynamic> _$$AllergenDtoImplToJson(_$AllergenDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lan': instance.lan,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      lan: json['lan'] as String?,
      emoji: json['emoji'] as String?,
      recipes: (json['recipes'] as List<dynamic>?)
          ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lan': instance.lan,
      'emoji': instance.emoji,
      'recipes': instance.recipes?.map((e) => e.toJson()).toList(),
    };
