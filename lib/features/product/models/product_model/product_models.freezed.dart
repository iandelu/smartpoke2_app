// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int? get id => throw _privateConstructorUsedError;
  String? get ean => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get nutriscore => throw _privateConstructorUsedError;
  int? get novaGroup => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get ingredients => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  String? get preservation => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  DateTime? get lastUpdate => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;
  Nutrients? get nutrients => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<AllergenDto>? get allergens => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {int? id,
      String? ean,
      String name,
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
      Category? category,
      String? keywords,
      Nutrients? nutrients,
      List<String>? tags,
      List<AllergenDto>? allergens});

  $CategoryCopyWith<$Res>? get category;
  $NutrientsCopyWith<$Res>? get nutrients;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ean = freezed,
    Object? name = null,
    Object? amount = freezed,
    Object? nutriscore = freezed,
    Object? novaGroup = freezed,
    Object? description = freezed,
    Object? brand = freezed,
    Object? ingredients = freezed,
    Object? origin = freezed,
    Object? preservation = freezed,
    Object? picture = freezed,
    Object? lastUpdate = freezed,
    Object? category = freezed,
    Object? keywords = freezed,
    Object? nutrients = freezed,
    Object? tags = freezed,
    Object? allergens = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ean: freezed == ean
          ? _value.ean
          : ean // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      nutriscore: freezed == nutriscore
          ? _value.nutriscore
          : nutriscore // ignore: cast_nullable_to_non_nullable
              as String?,
      novaGroup: freezed == novaGroup
          ? _value.novaGroup
          : novaGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      preservation: freezed == preservation
          ? _value.preservation
          : preservation // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      nutrients: freezed == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as Nutrients?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allergens: freezed == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<AllergenDto>?,
    ) as $Val);
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientsCopyWith<$Res>? get nutrients {
    if (_value.nutrients == null) {
      return null;
    }

    return $NutrientsCopyWith<$Res>(_value.nutrients!, (value) {
      return _then(_value.copyWith(nutrients: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? ean,
      String name,
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
      Category? category,
      String? keywords,
      Nutrients? nutrients,
      List<String>? tags,
      List<AllergenDto>? allergens});

  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $NutrientsCopyWith<$Res>? get nutrients;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ean = freezed,
    Object? name = null,
    Object? amount = freezed,
    Object? nutriscore = freezed,
    Object? novaGroup = freezed,
    Object? description = freezed,
    Object? brand = freezed,
    Object? ingredients = freezed,
    Object? origin = freezed,
    Object? preservation = freezed,
    Object? picture = freezed,
    Object? lastUpdate = freezed,
    Object? category = freezed,
    Object? keywords = freezed,
    Object? nutrients = freezed,
    Object? tags = freezed,
    Object? allergens = freezed,
  }) {
    return _then(_$ProductModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ean: freezed == ean
          ? _value.ean
          : ean // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      nutriscore: freezed == nutriscore
          ? _value.nutriscore
          : nutriscore // ignore: cast_nullable_to_non_nullable
              as String?,
      novaGroup: freezed == novaGroup
          ? _value.novaGroup
          : novaGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      preservation: freezed == preservation
          ? _value.preservation
          : preservation // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdate: freezed == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      nutrients: freezed == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as Nutrients?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      allergens: freezed == allergens
          ? _value._allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<AllergenDto>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {this.id,
      this.ean,
      required this.name,
      this.amount,
      this.nutriscore,
      this.novaGroup,
      this.description,
      this.brand,
      this.ingredients,
      this.origin,
      this.preservation,
      this.picture,
      this.lastUpdate,
      this.category,
      this.keywords,
      this.nutrients,
      final List<String>? tags,
      final List<AllergenDto>? allergens})
      : _tags = tags,
        _allergens = allergens;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? ean;
  @override
  final String name;
  @override
  final String? amount;
  @override
  final String? nutriscore;
  @override
  final int? novaGroup;
  @override
  final String? description;
  @override
  final String? brand;
  @override
  final String? ingredients;
  @override
  final String? origin;
  @override
  final String? preservation;
  @override
  final String? picture;
  @override
  final DateTime? lastUpdate;
  @override
  final Category? category;
  @override
  final String? keywords;
  @override
  final Nutrients? nutrients;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AllergenDto>? _allergens;
  @override
  List<AllergenDto>? get allergens {
    final value = _allergens;
    if (value == null) return null;
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, ean: $ean, name: $name, amount: $amount, nutriscore: $nutriscore, novaGroup: $novaGroup, description: $description, brand: $brand, ingredients: $ingredients, origin: $origin, preservation: $preservation, picture: $picture, lastUpdate: $lastUpdate, category: $category, keywords: $keywords, nutrients: $nutrients, tags: $tags, allergens: $allergens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ean, ean) || other.ean == ean) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.nutriscore, nutriscore) ||
                other.nutriscore == nutriscore) &&
            (identical(other.novaGroup, novaGroup) ||
                other.novaGroup == novaGroup) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.preservation, preservation) ||
                other.preservation == preservation) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.nutrients, nutrients) ||
                other.nutrients == nutrients) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._allergens, _allergens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ean,
      name,
      amount,
      nutriscore,
      novaGroup,
      description,
      brand,
      ingredients,
      origin,
      preservation,
      picture,
      lastUpdate,
      category,
      keywords,
      nutrients,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_allergens));

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {final int? id,
      final String? ean,
      required final String name,
      final String? amount,
      final String? nutriscore,
      final int? novaGroup,
      final String? description,
      final String? brand,
      final String? ingredients,
      final String? origin,
      final String? preservation,
      final String? picture,
      final DateTime? lastUpdate,
      final Category? category,
      final String? keywords,
      final Nutrients? nutrients,
      final List<String>? tags,
      final List<AllergenDto>? allergens}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get ean;
  @override
  String get name;
  @override
  String? get amount;
  @override
  String? get nutriscore;
  @override
  int? get novaGroup;
  @override
  String? get description;
  @override
  String? get brand;
  @override
  String? get ingredients;
  @override
  String? get origin;
  @override
  String? get preservation;
  @override
  String? get picture;
  @override
  DateTime? get lastUpdate;
  @override
  Category? get category;
  @override
  String? get keywords;
  @override
  Nutrients? get nutrients;
  @override
  List<String>? get tags;
  @override
  List<AllergenDto>? get allergens;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AllergenDto _$AllergenDtoFromJson(Map<String, dynamic> json) {
  return _AllergenDto.fromJson(json);
}

/// @nodoc
mixin _$AllergenDto {
  String get name => throw _privateConstructorUsedError;
  String get lan => throw _privateConstructorUsedError;

  /// Serializes this AllergenDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllergenDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllergenDtoCopyWith<AllergenDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllergenDtoCopyWith<$Res> {
  factory $AllergenDtoCopyWith(
          AllergenDto value, $Res Function(AllergenDto) then) =
      _$AllergenDtoCopyWithImpl<$Res, AllergenDto>;
  @useResult
  $Res call({String name, String lan});
}

/// @nodoc
class _$AllergenDtoCopyWithImpl<$Res, $Val extends AllergenDto>
    implements $AllergenDtoCopyWith<$Res> {
  _$AllergenDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllergenDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lan = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lan: null == lan
          ? _value.lan
          : lan // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllergenDtoImplCopyWith<$Res>
    implements $AllergenDtoCopyWith<$Res> {
  factory _$$AllergenDtoImplCopyWith(
          _$AllergenDtoImpl value, $Res Function(_$AllergenDtoImpl) then) =
      __$$AllergenDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String lan});
}

/// @nodoc
class __$$AllergenDtoImplCopyWithImpl<$Res>
    extends _$AllergenDtoCopyWithImpl<$Res, _$AllergenDtoImpl>
    implements _$$AllergenDtoImplCopyWith<$Res> {
  __$$AllergenDtoImplCopyWithImpl(
      _$AllergenDtoImpl _value, $Res Function(_$AllergenDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllergenDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lan = null,
  }) {
    return _then(_$AllergenDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lan: null == lan
          ? _value.lan
          : lan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AllergenDtoImpl implements _AllergenDto {
  const _$AllergenDtoImpl({required this.name, required this.lan});

  factory _$AllergenDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllergenDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String lan;

  @override
  String toString() {
    return 'AllergenDto(name: $name, lan: $lan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllergenDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lan, lan) || other.lan == lan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, lan);

  /// Create a copy of AllergenDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllergenDtoImplCopyWith<_$AllergenDtoImpl> get copyWith =>
      __$$AllergenDtoImplCopyWithImpl<_$AllergenDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllergenDtoImplToJson(
      this,
    );
  }
}

abstract class _AllergenDto implements AllergenDto {
  const factory _AllergenDto(
      {required final String name,
      required final String lan}) = _$AllergenDtoImpl;

  factory _AllergenDto.fromJson(Map<String, dynamic> json) =
      _$AllergenDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get lan;

  /// Create a copy of AllergenDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllergenDtoImplCopyWith<_$AllergenDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get lan => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
  List<RecipeModel>? get recipes => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? lan,
      String? emoji,
      List<RecipeModel>? recipes});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lan = freezed,
    Object? emoji = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lan: freezed == lan
          ? _value.lan
          : lan // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      recipes: freezed == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? lan,
      String? emoji,
      List<RecipeModel>? recipes});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lan = freezed,
    Object? emoji = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lan: freezed == lan
          ? _value.lan
          : lan // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      recipes: freezed == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {required this.id,
      required this.name,
      this.lan,
      this.emoji,
      final List<RecipeModel>? recipes})
      : _recipes = recipes;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? lan;
  @override
  final String? emoji;
  final List<RecipeModel>? _recipes;
  @override
  List<RecipeModel>? get recipes {
    final value = _recipes;
    if (value == null) return null;
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, lan: $lan, emoji: $emoji, recipes: $recipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lan, lan) || other.lan == lan) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, lan, emoji,
      const DeepCollectionEquality().hash(_recipes));

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {required final int id,
      required final String name,
      final String? lan,
      final String? emoji,
      final List<RecipeModel>? recipes}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get lan;
  @override
  String? get emoji;
  @override
  List<RecipeModel>? get recipes;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
