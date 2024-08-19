// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutrientsImplAdapter extends TypeAdapter<_$NutrientsImpl> {
  @override
  final int typeId = 0;

  @override
  _$NutrientsImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$NutrientsImpl(
      amount: fields[0] as int,
      calories: fields[1] as int,
      fats: fields[2] as double,
      saturatedFats: fields[3] as double,
      cholesterol: fields[4] as double,
      cabs: fields[5] as double,
      fiber: fields[6] as double,
      protein: fields[7] as double,
      salt: fields[8] as double,
      alcohol: fields[9] as double,
      water: fields[10] as double,
      caffeine: fields[11] as double,
      sugars: fields[12] as double,
      calcium: fields[13] as double,
      iron: fields[14] as double,
      magnesium: fields[15] as double,
      phosphorus: fields[16] as double,
      potassium: fields[17] as double,
      sodium: fields[18] as double,
      zinc: fields[19] as double,
      copper: fields[20] as double,
      retinol: fields[21] as double,
      vitaminA: fields[22] as double,
      vitaminE: fields[23] as double,
      vitaminD: fields[24] as double,
      vitaminC: fields[25] as double,
      vitaminB6: fields[26] as double,
      vitaminB12: fields[27] as double,
      vitaminK: fields[28] as double,
      thiamin: fields[29] as double,
      niacin: fields[30] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$NutrientsImpl obj) {
    writer
      ..writeByte(31)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.calories)
      ..writeByte(2)
      ..write(obj.fats)
      ..writeByte(3)
      ..write(obj.saturatedFats)
      ..writeByte(4)
      ..write(obj.cholesterol)
      ..writeByte(5)
      ..write(obj.cabs)
      ..writeByte(6)
      ..write(obj.fiber)
      ..writeByte(7)
      ..write(obj.protein)
      ..writeByte(8)
      ..write(obj.salt)
      ..writeByte(9)
      ..write(obj.alcohol)
      ..writeByte(10)
      ..write(obj.water)
      ..writeByte(11)
      ..write(obj.caffeine)
      ..writeByte(12)
      ..write(obj.sugars)
      ..writeByte(13)
      ..write(obj.calcium)
      ..writeByte(14)
      ..write(obj.iron)
      ..writeByte(15)
      ..write(obj.magnesium)
      ..writeByte(16)
      ..write(obj.phosphorus)
      ..writeByte(17)
      ..write(obj.potassium)
      ..writeByte(18)
      ..write(obj.sodium)
      ..writeByte(19)
      ..write(obj.zinc)
      ..writeByte(20)
      ..write(obj.copper)
      ..writeByte(21)
      ..write(obj.retinol)
      ..writeByte(22)
      ..write(obj.vitaminA)
      ..writeByte(23)
      ..write(obj.vitaminE)
      ..writeByte(24)
      ..write(obj.vitaminD)
      ..writeByte(25)
      ..write(obj.vitaminC)
      ..writeByte(26)
      ..write(obj.vitaminB6)
      ..writeByte(27)
      ..write(obj.vitaminB12)
      ..writeByte(28)
      ..write(obj.vitaminK)
      ..writeByte(29)
      ..write(obj.thiamin)
      ..writeByte(30)
      ..write(obj.niacin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutrientsImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeModelImpl _$$RecipeModelImplFromJson(Map<String, dynamic> json) =>
    _$RecipeModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String? ?? 'No description available',
      totalTime: (json['totalTime'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      yields: (json['yields'] as num?)?.toInt() ?? 1,
      pictureUrl: json['pictureUrl'] as String? ?? '',
      source: json['source'] as String? ?? 'Unknown',
      lan: json['lan'] as String? ?? 'en',
      ratings: (json['ratings'] as num?)?.toDouble() ?? 5.0,
      views: (json['views'] as num?)?.toInt() ?? 0,
      videoUrl: json['videoUrl'] as String?,
      lastUpdateDate: json['lastUpdateDate'] == null
          ? null
          : DateTime.parse(json['lastUpdateDate'] as String),
      imageFile: _$JsonConverterFromJson<String, Uint8List>(
          json['imageFile'], const Uint8ListConverter().fromJson),
      difficulty: json['difficulty'] as String? ?? 'easy',
      nutrients: json['nutrients'] == null
          ? const Nutrients()
          : Nutrients.fromJson(json['nutrients'] as Map<String, dynamic>),
      recipeSteps: (json['recipeSteps'] as List<dynamic>?)
              ?.map((e) => RecipeStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recipeProducts: (json['recipeProducts'] as List<dynamic>?)
              ?.map((e) => RecipeProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      addTime: json['addTime'] as String? ?? '',
    );

Map<String, dynamic> _$$RecipeModelImplToJson(_$RecipeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'totalTime': instance.totalTime,
      'price': instance.price,
      'yields': instance.yields,
      'pictureUrl': instance.pictureUrl,
      'source': instance.source,
      'lan': instance.lan,
      'ratings': instance.ratings,
      'views': instance.views,
      'videoUrl': instance.videoUrl,
      'lastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'imageFile': _$JsonConverterToJson<String, Uint8List>(
          instance.imageFile, const Uint8ListConverter().toJson),
      'difficulty': instance.difficulty,
      'nutrients': instance.nutrients.toJson(),
      'recipeSteps': instance.recipeSteps.map((e) => e.toJson()).toList(),
      'recipeProducts': instance.recipeProducts.map((e) => e.toJson()).toList(),
      'categories': instance.categories.map((e) => e.toJson()).toList(),
      'user': instance.user?.toJson(),
      'addTime': instance.addTime,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$NutrientsImpl _$$NutrientsImplFromJson(Map<String, dynamic> json) =>
    _$NutrientsImpl(
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      calories: (json['calories'] as num?)?.toInt() ?? 0,
      fats: (json['fats'] as num?)?.toDouble() ?? 0.0,
      saturatedFats: (json['saturatedFats'] as num?)?.toDouble() ?? 0.0,
      cholesterol: (json['cholesterol'] as num?)?.toDouble() ?? 0.0,
      cabs: (json['cabs'] as num?)?.toDouble() ?? 0.0,
      fiber: (json['fiber'] as num?)?.toDouble() ?? 0.0,
      protein: (json['protein'] as num?)?.toDouble() ?? 0.0,
      salt: (json['salt'] as num?)?.toDouble() ?? 0.0,
      alcohol: (json['alcohol'] as num?)?.toDouble() ?? 0.0,
      water: (json['water'] as num?)?.toDouble() ?? 0.0,
      caffeine: (json['caffeine'] as num?)?.toDouble() ?? 0.0,
      sugars: (json['sugars'] as num?)?.toDouble() ?? 0.0,
      calcium: (json['calcium'] as num?)?.toDouble() ?? 0.0,
      iron: (json['iron'] as num?)?.toDouble() ?? 0.0,
      magnesium: (json['magnesium'] as num?)?.toDouble() ?? 0.0,
      phosphorus: (json['phosphorus'] as num?)?.toDouble() ?? 0.0,
      potassium: (json['potassium'] as num?)?.toDouble() ?? 0.0,
      sodium: (json['sodium'] as num?)?.toDouble() ?? 0.0,
      zinc: (json['zinc'] as num?)?.toDouble() ?? 0.0,
      copper: (json['copper'] as num?)?.toDouble() ?? 0.0,
      retinol: (json['retinol'] as num?)?.toDouble() ?? 0.0,
      vitaminA: (json['vitaminA'] as num?)?.toDouble() ?? 0.0,
      vitaminE: (json['vitaminE'] as num?)?.toDouble() ?? 0.0,
      vitaminD: (json['vitaminD'] as num?)?.toDouble() ?? 0.0,
      vitaminC: (json['vitaminC'] as num?)?.toDouble() ?? 0.0,
      vitaminB6: (json['vitaminB6'] as num?)?.toDouble() ?? 0.0,
      vitaminB12: (json['vitaminB12'] as num?)?.toDouble() ?? 0.0,
      vitaminK: (json['vitaminK'] as num?)?.toDouble() ?? 0.0,
      thiamin: (json['thiamin'] as num?)?.toDouble() ?? 0.0,
      niacin: (json['niacin'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$NutrientsImplToJson(_$NutrientsImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'calories': instance.calories,
      'fats': instance.fats,
      'saturatedFats': instance.saturatedFats,
      'cholesterol': instance.cholesterol,
      'cabs': instance.cabs,
      'fiber': instance.fiber,
      'protein': instance.protein,
      'salt': instance.salt,
      'alcohol': instance.alcohol,
      'water': instance.water,
      'caffeine': instance.caffeine,
      'sugars': instance.sugars,
      'calcium': instance.calcium,
      'iron': instance.iron,
      'magnesium': instance.magnesium,
      'phosphorus': instance.phosphorus,
      'potassium': instance.potassium,
      'sodium': instance.sodium,
      'zinc': instance.zinc,
      'copper': instance.copper,
      'retinol': instance.retinol,
      'vitaminA': instance.vitaminA,
      'vitaminE': instance.vitaminE,
      'vitaminD': instance.vitaminD,
      'vitaminC': instance.vitaminC,
      'vitaminB6': instance.vitaminB6,
      'vitaminB12': instance.vitaminB12,
      'vitaminK': instance.vitaminK,
      'thiamin': instance.thiamin,
      'niacin': instance.niacin,
    };

_$RecipeStepImpl _$$RecipeStepImplFromJson(Map<String, dynamic> json) =>
    _$RecipeStepImpl(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String? ?? 'No description available',
      position: (json['position'] as num?)?.toInt() ?? 0,
      time: (json['time'] as num?)?.toInt() ?? 0,
      picture: json['picture'] as String? ?? '',
    );

Map<String, dynamic> _$$RecipeStepImplToJson(_$RecipeStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'position': instance.position,
      'time': instance.time,
      'picture': instance.picture,
    };

_$RecipeProductImpl _$$RecipeProductImplFromJson(Map<String, dynamic> json) =>
    _$RecipeProductImpl(
      id: (json['id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      text: json['text'] as String? ?? 'No text available',
      ingredientName: json['ingredientName'] as String? ?? 'Unknown ingredient',
      unitOfMeasure: json['unitOfMeasure'] == null
          ? null
          : UnitOfMeasure.fromJson(
              json['unitOfMeasure'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecipeProductImplToJson(_$RecipeProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'text': instance.text,
      'ingredientName': instance.ingredientName,
      'unitOfMeasure': instance.unitOfMeasure?.toJson(),
      'product': instance.product?.toJson(),
    };

_$UnitOfMeasureImpl _$$UnitOfMeasureImplFromJson(Map<String, dynamic> json) =>
    _$UnitOfMeasureImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$UnitOfMeasureImplToJson(_$UnitOfMeasureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
