// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) {
  return _RecipeModel.fromJson(json);
}

/// @nodoc
mixin _$RecipeModel {
  dynamic get key => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get totalTime => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get yields => throw _privateConstructorUsedError;
  String get pictureUrl => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get lan => throw _privateConstructorUsedError;
  double get ratings => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  DateTime? get lastUpdateDate => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get imageFile => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  Nutrients get nutrients => throw _privateConstructorUsedError;
  List<RecipeStep> get recipeSteps => throw _privateConstructorUsedError;
  List<RecipeProduct> get recipeProducts => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  String get addTime => throw _privateConstructorUsedError;

  /// Serializes this RecipeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeModelCopyWith<RecipeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeModelCopyWith<$Res> {
  factory $RecipeModelCopyWith(
          RecipeModel value, $Res Function(RecipeModel) then) =
      _$RecipeModelCopyWithImpl<$Res, RecipeModel>;
  @useResult
  $Res call(
      {dynamic key,
      int? id,
      String name,
      String description,
      int totalTime,
      double price,
      int yields,
      String pictureUrl,
      String source,
      String lan,
      double ratings,
      int views,
      String? videoUrl,
      DateTime? lastUpdateDate,
      @Uint8ListConverter() Uint8List? imageFile,
      String difficulty,
      Nutrients nutrients,
      List<RecipeStep> recipeSteps,
      List<RecipeProduct> recipeProducts,
      List<CategoryModel> categories,
      UserModel? user,
      String addTime});

  $NutrientsCopyWith<$Res> get nutrients;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$RecipeModelCopyWithImpl<$Res, $Val extends RecipeModel>
    implements $RecipeModelCopyWith<$Res> {
  _$RecipeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? totalTime = null,
    Object? price = null,
    Object? yields = null,
    Object? pictureUrl = null,
    Object? source = null,
    Object? lan = null,
    Object? ratings = null,
    Object? views = null,
    Object? videoUrl = freezed,
    Object? lastUpdateDate = freezed,
    Object? imageFile = freezed,
    Object? difficulty = null,
    Object? nutrients = null,
    Object? recipeSteps = null,
    Object? recipeProducts = null,
    Object? categories = null,
    Object? user = freezed,
    Object? addTime = null,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      yields: null == yields
          ? _value.yields
          : yields // ignore: cast_nullable_to_non_nullable
              as int,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      lan: null == lan
          ? _value.lan
          : lan // ignore: cast_nullable_to_non_nullable
              as String,
      ratings: null == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as double,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdateDate: freezed == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      nutrients: null == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as Nutrients,
      recipeSteps: null == recipeSteps
          ? _value.recipeSteps
          : recipeSteps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
      recipeProducts: null == recipeProducts
          ? _value.recipeProducts
          : recipeProducts // ignore: cast_nullable_to_non_nullable
              as List<RecipeProduct>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      addTime: null == addTime
          ? _value.addTime
          : addTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientsCopyWith<$Res> get nutrients {
    return $NutrientsCopyWith<$Res>(_value.nutrients, (value) {
      return _then(_value.copyWith(nutrients: value) as $Val);
    });
  }

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeModelImplCopyWith<$Res>
    implements $RecipeModelCopyWith<$Res> {
  factory _$$RecipeModelImplCopyWith(
          _$RecipeModelImpl value, $Res Function(_$RecipeModelImpl) then) =
      __$$RecipeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic key,
      int? id,
      String name,
      String description,
      int totalTime,
      double price,
      int yields,
      String pictureUrl,
      String source,
      String lan,
      double ratings,
      int views,
      String? videoUrl,
      DateTime? lastUpdateDate,
      @Uint8ListConverter() Uint8List? imageFile,
      String difficulty,
      Nutrients nutrients,
      List<RecipeStep> recipeSteps,
      List<RecipeProduct> recipeProducts,
      List<CategoryModel> categories,
      UserModel? user,
      String addTime});

  @override
  $NutrientsCopyWith<$Res> get nutrients;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$RecipeModelImplCopyWithImpl<$Res>
    extends _$RecipeModelCopyWithImpl<$Res, _$RecipeModelImpl>
    implements _$$RecipeModelImplCopyWith<$Res> {
  __$$RecipeModelImplCopyWithImpl(
      _$RecipeModelImpl _value, $Res Function(_$RecipeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? totalTime = null,
    Object? price = null,
    Object? yields = null,
    Object? pictureUrl = null,
    Object? source = null,
    Object? lan = null,
    Object? ratings = null,
    Object? views = null,
    Object? videoUrl = freezed,
    Object? lastUpdateDate = freezed,
    Object? imageFile = freezed,
    Object? difficulty = null,
    Object? nutrients = null,
    Object? recipeSteps = null,
    Object? recipeProducts = null,
    Object? categories = null,
    Object? user = freezed,
    Object? addTime = null,
  }) {
    return _then(_$RecipeModelImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      yields: null == yields
          ? _value.yields
          : yields // ignore: cast_nullable_to_non_nullable
              as int,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      lan: null == lan
          ? _value.lan
          : lan // ignore: cast_nullable_to_non_nullable
              as String,
      ratings: null == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as double,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdateDate: freezed == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      nutrients: null == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as Nutrients,
      recipeSteps: null == recipeSteps
          ? _value._recipeSteps
          : recipeSteps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStep>,
      recipeProducts: null == recipeProducts
          ? _value._recipeProducts
          : recipeProducts // ignore: cast_nullable_to_non_nullable
              as List<RecipeProduct>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      addTime: null == addTime
          ? _value.addTime
          : addTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeModelImpl implements _RecipeModel {
  const _$RecipeModelImpl(
      {required this.key,
      required this.id,
      required this.name,
      this.description = 'No description available',
      this.totalTime = 0,
      this.price = 0.0,
      this.yields = 1,
      this.pictureUrl = '',
      this.source = 'Unknown',
      this.lan = 'en',
      this.ratings = 5.0,
      this.views = 0,
      this.videoUrl,
      this.lastUpdateDate,
      @Uint8ListConverter() this.imageFile,
      this.difficulty = 'easy',
      this.nutrients = const Nutrients(),
      final List<RecipeStep> recipeSteps = const [],
      final List<RecipeProduct> recipeProducts = const [],
      final List<CategoryModel> categories = const [],
      this.user,
      this.addTime = ''})
      : _recipeSteps = recipeSteps,
        _recipeProducts = recipeProducts,
        _categories = categories;

  factory _$RecipeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeModelImplFromJson(json);

  @override
  final dynamic key;
  @override
  final int? id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int totalTime;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final int yields;
  @override
  @JsonKey()
  final String pictureUrl;
  @override
  @JsonKey()
  final String source;
  @override
  @JsonKey()
  final String lan;
  @override
  @JsonKey()
  final double ratings;
  @override
  @JsonKey()
  final int views;
  @override
  final String? videoUrl;
  @override
  final DateTime? lastUpdateDate;
  @override
  @Uint8ListConverter()
  final Uint8List? imageFile;
  @override
  @JsonKey()
  final String difficulty;
  @override
  @JsonKey()
  final Nutrients nutrients;
  final List<RecipeStep> _recipeSteps;
  @override
  @JsonKey()
  List<RecipeStep> get recipeSteps {
    if (_recipeSteps is EqualUnmodifiableListView) return _recipeSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeSteps);
  }

  final List<RecipeProduct> _recipeProducts;
  @override
  @JsonKey()
  List<RecipeProduct> get recipeProducts {
    if (_recipeProducts is EqualUnmodifiableListView) return _recipeProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeProducts);
  }

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final UserModel? user;
  @override
  @JsonKey()
  final String addTime;

  @override
  String toString() {
    return 'RecipeModel(key: $key, id: $id, name: $name, description: $description, totalTime: $totalTime, price: $price, yields: $yields, pictureUrl: $pictureUrl, source: $source, lan: $lan, ratings: $ratings, views: $views, videoUrl: $videoUrl, lastUpdateDate: $lastUpdateDate, imageFile: $imageFile, difficulty: $difficulty, nutrients: $nutrients, recipeSteps: $recipeSteps, recipeProducts: $recipeProducts, categories: $categories, user: $user, addTime: $addTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeModelImpl &&
            const DeepCollectionEquality().equals(other.key, key) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.yields, yields) || other.yields == yields) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.lan, lan) || other.lan == lan) &&
            (identical(other.ratings, ratings) || other.ratings == ratings) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.lastUpdateDate, lastUpdateDate) ||
                other.lastUpdateDate == lastUpdateDate) &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.nutrients, nutrients) ||
                other.nutrients == nutrients) &&
            const DeepCollectionEquality()
                .equals(other._recipeSteps, _recipeSteps) &&
            const DeepCollectionEquality()
                .equals(other._recipeProducts, _recipeProducts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.addTime, addTime) || other.addTime == addTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(key),
        id,
        name,
        description,
        totalTime,
        price,
        yields,
        pictureUrl,
        source,
        lan,
        ratings,
        views,
        videoUrl,
        lastUpdateDate,
        const DeepCollectionEquality().hash(imageFile),
        difficulty,
        nutrients,
        const DeepCollectionEquality().hash(_recipeSteps),
        const DeepCollectionEquality().hash(_recipeProducts),
        const DeepCollectionEquality().hash(_categories),
        user,
        addTime
      ]);

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeModelImplCopyWith<_$RecipeModelImpl> get copyWith =>
      __$$RecipeModelImplCopyWithImpl<_$RecipeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeModelImplToJson(
      this,
    );
  }
}

abstract class _RecipeModel implements RecipeModel {
  const factory _RecipeModel(
      {required final dynamic key,
      required final int? id,
      required final String name,
      final String description,
      final int totalTime,
      final double price,
      final int yields,
      final String pictureUrl,
      final String source,
      final String lan,
      final double ratings,
      final int views,
      final String? videoUrl,
      final DateTime? lastUpdateDate,
      @Uint8ListConverter() final Uint8List? imageFile,
      final String difficulty,
      final Nutrients nutrients,
      final List<RecipeStep> recipeSteps,
      final List<RecipeProduct> recipeProducts,
      final List<CategoryModel> categories,
      final UserModel? user,
      final String addTime}) = _$RecipeModelImpl;

  factory _RecipeModel.fromJson(Map<String, dynamic> json) =
      _$RecipeModelImpl.fromJson;

  @override
  dynamic get key;
  @override
  int? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get totalTime;
  @override
  double get price;
  @override
  int get yields;
  @override
  String get pictureUrl;
  @override
  String get source;
  @override
  String get lan;
  @override
  double get ratings;
  @override
  int get views;
  @override
  String? get videoUrl;
  @override
  DateTime? get lastUpdateDate;
  @override
  @Uint8ListConverter()
  Uint8List? get imageFile;
  @override
  String get difficulty;
  @override
  Nutrients get nutrients;
  @override
  List<RecipeStep> get recipeSteps;
  @override
  List<RecipeProduct> get recipeProducts;
  @override
  List<CategoryModel> get categories;
  @override
  UserModel? get user;
  @override
  String get addTime;

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeModelImplCopyWith<_$RecipeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Nutrients _$NutrientsFromJson(Map<String, dynamic> json) {
  return _Nutrients.fromJson(json);
}

/// @nodoc
mixin _$Nutrients {
  @HiveField(0)
  int get amount => throw _privateConstructorUsedError;
  @HiveField(1)
  int get calories => throw _privateConstructorUsedError;
  @HiveField(2)
  double get fats => throw _privateConstructorUsedError;
  @HiveField(3)
  double get saturatedFats => throw _privateConstructorUsedError;
  @HiveField(4)
  double get cholesterol => throw _privateConstructorUsedError;
  @HiveField(5)
  double get cabs => throw _privateConstructorUsedError;
  @HiveField(6)
  double get fiber => throw _privateConstructorUsedError;
  @HiveField(7)
  double get protein => throw _privateConstructorUsedError;
  @HiveField(8)
  double get salt => throw _privateConstructorUsedError;
  @HiveField(9)
  double get alcohol => throw _privateConstructorUsedError;
  @HiveField(10)
  double get water => throw _privateConstructorUsedError;
  @HiveField(11)
  double get caffeine => throw _privateConstructorUsedError;
  @HiveField(12)
  double get sugars => throw _privateConstructorUsedError;
  @HiveField(13)
  double get calcium => throw _privateConstructorUsedError;
  @HiveField(14)
  double get iron => throw _privateConstructorUsedError;
  @HiveField(15)
  double get magnesium => throw _privateConstructorUsedError;
  @HiveField(16)
  double get phosphorus => throw _privateConstructorUsedError;
  @HiveField(17)
  double get potassium => throw _privateConstructorUsedError;
  @HiveField(18)
  double get sodium => throw _privateConstructorUsedError;
  @HiveField(19)
  double get zinc => throw _privateConstructorUsedError;
  @HiveField(20)
  double get copper => throw _privateConstructorUsedError;
  @HiveField(21)
  double get retinol => throw _privateConstructorUsedError;
  @HiveField(22)
  double get vitaminA => throw _privateConstructorUsedError;
  @HiveField(23)
  double get vitaminE => throw _privateConstructorUsedError;
  @HiveField(24)
  double get vitaminD => throw _privateConstructorUsedError;
  @HiveField(25)
  double get vitaminC => throw _privateConstructorUsedError;
  @HiveField(26)
  double get vitaminB6 => throw _privateConstructorUsedError;
  @HiveField(27)
  double get vitaminB12 => throw _privateConstructorUsedError;
  @HiveField(28)
  double get vitaminK => throw _privateConstructorUsedError;
  @HiveField(29)
  double get thiamin => throw _privateConstructorUsedError;
  @HiveField(30)
  double get niacin => throw _privateConstructorUsedError;

  /// Serializes this Nutrients to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Nutrients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientsCopyWith<Nutrients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientsCopyWith<$Res> {
  factory $NutrientsCopyWith(Nutrients value, $Res Function(Nutrients) then) =
      _$NutrientsCopyWithImpl<$Res, Nutrients>;
  @useResult
  $Res call(
      {@HiveField(0) int amount,
      @HiveField(1) int calories,
      @HiveField(2) double fats,
      @HiveField(3) double saturatedFats,
      @HiveField(4) double cholesterol,
      @HiveField(5) double cabs,
      @HiveField(6) double fiber,
      @HiveField(7) double protein,
      @HiveField(8) double salt,
      @HiveField(9) double alcohol,
      @HiveField(10) double water,
      @HiveField(11) double caffeine,
      @HiveField(12) double sugars,
      @HiveField(13) double calcium,
      @HiveField(14) double iron,
      @HiveField(15) double magnesium,
      @HiveField(16) double phosphorus,
      @HiveField(17) double potassium,
      @HiveField(18) double sodium,
      @HiveField(19) double zinc,
      @HiveField(20) double copper,
      @HiveField(21) double retinol,
      @HiveField(22) double vitaminA,
      @HiveField(23) double vitaminE,
      @HiveField(24) double vitaminD,
      @HiveField(25) double vitaminC,
      @HiveField(26) double vitaminB6,
      @HiveField(27) double vitaminB12,
      @HiveField(28) double vitaminK,
      @HiveField(29) double thiamin,
      @HiveField(30) double niacin});
}

/// @nodoc
class _$NutrientsCopyWithImpl<$Res, $Val extends Nutrients>
    implements $NutrientsCopyWith<$Res> {
  _$NutrientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Nutrients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? calories = null,
    Object? fats = null,
    Object? saturatedFats = null,
    Object? cholesterol = null,
    Object? cabs = null,
    Object? fiber = null,
    Object? protein = null,
    Object? salt = null,
    Object? alcohol = null,
    Object? water = null,
    Object? caffeine = null,
    Object? sugars = null,
    Object? calcium = null,
    Object? iron = null,
    Object? magnesium = null,
    Object? phosphorus = null,
    Object? potassium = null,
    Object? sodium = null,
    Object? zinc = null,
    Object? copper = null,
    Object? retinol = null,
    Object? vitaminA = null,
    Object? vitaminE = null,
    Object? vitaminD = null,
    Object? vitaminC = null,
    Object? vitaminB6 = null,
    Object? vitaminB12 = null,
    Object? vitaminK = null,
    Object? thiamin = null,
    Object? niacin = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      fats: null == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double,
      saturatedFats: null == saturatedFats
          ? _value.saturatedFats
          : saturatedFats // ignore: cast_nullable_to_non_nullable
              as double,
      cholesterol: null == cholesterol
          ? _value.cholesterol
          : cholesterol // ignore: cast_nullable_to_non_nullable
              as double,
      cabs: null == cabs
          ? _value.cabs
          : cabs // ignore: cast_nullable_to_non_nullable
              as double,
      fiber: null == fiber
          ? _value.fiber
          : fiber // ignore: cast_nullable_to_non_nullable
              as double,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double,
      salt: null == salt
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as double,
      alcohol: null == alcohol
          ? _value.alcohol
          : alcohol // ignore: cast_nullable_to_non_nullable
              as double,
      water: null == water
          ? _value.water
          : water // ignore: cast_nullable_to_non_nullable
              as double,
      caffeine: null == caffeine
          ? _value.caffeine
          : caffeine // ignore: cast_nullable_to_non_nullable
              as double,
      sugars: null == sugars
          ? _value.sugars
          : sugars // ignore: cast_nullable_to_non_nullable
              as double,
      calcium: null == calcium
          ? _value.calcium
          : calcium // ignore: cast_nullable_to_non_nullable
              as double,
      iron: null == iron
          ? _value.iron
          : iron // ignore: cast_nullable_to_non_nullable
              as double,
      magnesium: null == magnesium
          ? _value.magnesium
          : magnesium // ignore: cast_nullable_to_non_nullable
              as double,
      phosphorus: null == phosphorus
          ? _value.phosphorus
          : phosphorus // ignore: cast_nullable_to_non_nullable
              as double,
      potassium: null == potassium
          ? _value.potassium
          : potassium // ignore: cast_nullable_to_non_nullable
              as double,
      sodium: null == sodium
          ? _value.sodium
          : sodium // ignore: cast_nullable_to_non_nullable
              as double,
      zinc: null == zinc
          ? _value.zinc
          : zinc // ignore: cast_nullable_to_non_nullable
              as double,
      copper: null == copper
          ? _value.copper
          : copper // ignore: cast_nullable_to_non_nullable
              as double,
      retinol: null == retinol
          ? _value.retinol
          : retinol // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminA: null == vitaminA
          ? _value.vitaminA
          : vitaminA // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminE: null == vitaminE
          ? _value.vitaminE
          : vitaminE // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminD: null == vitaminD
          ? _value.vitaminD
          : vitaminD // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminC: null == vitaminC
          ? _value.vitaminC
          : vitaminC // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminB6: null == vitaminB6
          ? _value.vitaminB6
          : vitaminB6 // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminB12: null == vitaminB12
          ? _value.vitaminB12
          : vitaminB12 // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminK: null == vitaminK
          ? _value.vitaminK
          : vitaminK // ignore: cast_nullable_to_non_nullable
              as double,
      thiamin: null == thiamin
          ? _value.thiamin
          : thiamin // ignore: cast_nullable_to_non_nullable
              as double,
      niacin: null == niacin
          ? _value.niacin
          : niacin // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutrientsImplCopyWith<$Res>
    implements $NutrientsCopyWith<$Res> {
  factory _$$NutrientsImplCopyWith(
          _$NutrientsImpl value, $Res Function(_$NutrientsImpl) then) =
      __$$NutrientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int amount,
      @HiveField(1) int calories,
      @HiveField(2) double fats,
      @HiveField(3) double saturatedFats,
      @HiveField(4) double cholesterol,
      @HiveField(5) double cabs,
      @HiveField(6) double fiber,
      @HiveField(7) double protein,
      @HiveField(8) double salt,
      @HiveField(9) double alcohol,
      @HiveField(10) double water,
      @HiveField(11) double caffeine,
      @HiveField(12) double sugars,
      @HiveField(13) double calcium,
      @HiveField(14) double iron,
      @HiveField(15) double magnesium,
      @HiveField(16) double phosphorus,
      @HiveField(17) double potassium,
      @HiveField(18) double sodium,
      @HiveField(19) double zinc,
      @HiveField(20) double copper,
      @HiveField(21) double retinol,
      @HiveField(22) double vitaminA,
      @HiveField(23) double vitaminE,
      @HiveField(24) double vitaminD,
      @HiveField(25) double vitaminC,
      @HiveField(26) double vitaminB6,
      @HiveField(27) double vitaminB12,
      @HiveField(28) double vitaminK,
      @HiveField(29) double thiamin,
      @HiveField(30) double niacin});
}

/// @nodoc
class __$$NutrientsImplCopyWithImpl<$Res>
    extends _$NutrientsCopyWithImpl<$Res, _$NutrientsImpl>
    implements _$$NutrientsImplCopyWith<$Res> {
  __$$NutrientsImplCopyWithImpl(
      _$NutrientsImpl _value, $Res Function(_$NutrientsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Nutrients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? calories = null,
    Object? fats = null,
    Object? saturatedFats = null,
    Object? cholesterol = null,
    Object? cabs = null,
    Object? fiber = null,
    Object? protein = null,
    Object? salt = null,
    Object? alcohol = null,
    Object? water = null,
    Object? caffeine = null,
    Object? sugars = null,
    Object? calcium = null,
    Object? iron = null,
    Object? magnesium = null,
    Object? phosphorus = null,
    Object? potassium = null,
    Object? sodium = null,
    Object? zinc = null,
    Object? copper = null,
    Object? retinol = null,
    Object? vitaminA = null,
    Object? vitaminE = null,
    Object? vitaminD = null,
    Object? vitaminC = null,
    Object? vitaminB6 = null,
    Object? vitaminB12 = null,
    Object? vitaminK = null,
    Object? thiamin = null,
    Object? niacin = null,
  }) {
    return _then(_$NutrientsImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      fats: null == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double,
      saturatedFats: null == saturatedFats
          ? _value.saturatedFats
          : saturatedFats // ignore: cast_nullable_to_non_nullable
              as double,
      cholesterol: null == cholesterol
          ? _value.cholesterol
          : cholesterol // ignore: cast_nullable_to_non_nullable
              as double,
      cabs: null == cabs
          ? _value.cabs
          : cabs // ignore: cast_nullable_to_non_nullable
              as double,
      fiber: null == fiber
          ? _value.fiber
          : fiber // ignore: cast_nullable_to_non_nullable
              as double,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double,
      salt: null == salt
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as double,
      alcohol: null == alcohol
          ? _value.alcohol
          : alcohol // ignore: cast_nullable_to_non_nullable
              as double,
      water: null == water
          ? _value.water
          : water // ignore: cast_nullable_to_non_nullable
              as double,
      caffeine: null == caffeine
          ? _value.caffeine
          : caffeine // ignore: cast_nullable_to_non_nullable
              as double,
      sugars: null == sugars
          ? _value.sugars
          : sugars // ignore: cast_nullable_to_non_nullable
              as double,
      calcium: null == calcium
          ? _value.calcium
          : calcium // ignore: cast_nullable_to_non_nullable
              as double,
      iron: null == iron
          ? _value.iron
          : iron // ignore: cast_nullable_to_non_nullable
              as double,
      magnesium: null == magnesium
          ? _value.magnesium
          : magnesium // ignore: cast_nullable_to_non_nullable
              as double,
      phosphorus: null == phosphorus
          ? _value.phosphorus
          : phosphorus // ignore: cast_nullable_to_non_nullable
              as double,
      potassium: null == potassium
          ? _value.potassium
          : potassium // ignore: cast_nullable_to_non_nullable
              as double,
      sodium: null == sodium
          ? _value.sodium
          : sodium // ignore: cast_nullable_to_non_nullable
              as double,
      zinc: null == zinc
          ? _value.zinc
          : zinc // ignore: cast_nullable_to_non_nullable
              as double,
      copper: null == copper
          ? _value.copper
          : copper // ignore: cast_nullable_to_non_nullable
              as double,
      retinol: null == retinol
          ? _value.retinol
          : retinol // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminA: null == vitaminA
          ? _value.vitaminA
          : vitaminA // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminE: null == vitaminE
          ? _value.vitaminE
          : vitaminE // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminD: null == vitaminD
          ? _value.vitaminD
          : vitaminD // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminC: null == vitaminC
          ? _value.vitaminC
          : vitaminC // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminB6: null == vitaminB6
          ? _value.vitaminB6
          : vitaminB6 // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminB12: null == vitaminB12
          ? _value.vitaminB12
          : vitaminB12 // ignore: cast_nullable_to_non_nullable
              as double,
      vitaminK: null == vitaminK
          ? _value.vitaminK
          : vitaminK // ignore: cast_nullable_to_non_nullable
              as double,
      thiamin: null == thiamin
          ? _value.thiamin
          : thiamin // ignore: cast_nullable_to_non_nullable
              as double,
      niacin: null == niacin
          ? _value.niacin
          : niacin // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class _$NutrientsImpl implements _Nutrients {
  const _$NutrientsImpl(
      {@HiveField(0) this.amount = 0,
      @HiveField(1) this.calories = 0,
      @HiveField(2) this.fats = 0.0,
      @HiveField(3) this.saturatedFats = 0.0,
      @HiveField(4) this.cholesterol = 0.0,
      @HiveField(5) this.cabs = 0.0,
      @HiveField(6) this.fiber = 0.0,
      @HiveField(7) this.protein = 0.0,
      @HiveField(8) this.salt = 0.0,
      @HiveField(9) this.alcohol = 0.0,
      @HiveField(10) this.water = 0.0,
      @HiveField(11) this.caffeine = 0.0,
      @HiveField(12) this.sugars = 0.0,
      @HiveField(13) this.calcium = 0.0,
      @HiveField(14) this.iron = 0.0,
      @HiveField(15) this.magnesium = 0.0,
      @HiveField(16) this.phosphorus = 0.0,
      @HiveField(17) this.potassium = 0.0,
      @HiveField(18) this.sodium = 0.0,
      @HiveField(19) this.zinc = 0.0,
      @HiveField(20) this.copper = 0.0,
      @HiveField(21) this.retinol = 0.0,
      @HiveField(22) this.vitaminA = 0.0,
      @HiveField(23) this.vitaminE = 0.0,
      @HiveField(24) this.vitaminD = 0.0,
      @HiveField(25) this.vitaminC = 0.0,
      @HiveField(26) this.vitaminB6 = 0.0,
      @HiveField(27) this.vitaminB12 = 0.0,
      @HiveField(28) this.vitaminK = 0.0,
      @HiveField(29) this.thiamin = 0.0,
      @HiveField(30) this.niacin = 0.0});

  factory _$NutrientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutrientsImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final int amount;
  @override
  @JsonKey()
  @HiveField(1)
  final int calories;
  @override
  @JsonKey()
  @HiveField(2)
  final double fats;
  @override
  @JsonKey()
  @HiveField(3)
  final double saturatedFats;
  @override
  @JsonKey()
  @HiveField(4)
  final double cholesterol;
  @override
  @JsonKey()
  @HiveField(5)
  final double cabs;
  @override
  @JsonKey()
  @HiveField(6)
  final double fiber;
  @override
  @JsonKey()
  @HiveField(7)
  final double protein;
  @override
  @JsonKey()
  @HiveField(8)
  final double salt;
  @override
  @JsonKey()
  @HiveField(9)
  final double alcohol;
  @override
  @JsonKey()
  @HiveField(10)
  final double water;
  @override
  @JsonKey()
  @HiveField(11)
  final double caffeine;
  @override
  @JsonKey()
  @HiveField(12)
  final double sugars;
  @override
  @JsonKey()
  @HiveField(13)
  final double calcium;
  @override
  @JsonKey()
  @HiveField(14)
  final double iron;
  @override
  @JsonKey()
  @HiveField(15)
  final double magnesium;
  @override
  @JsonKey()
  @HiveField(16)
  final double phosphorus;
  @override
  @JsonKey()
  @HiveField(17)
  final double potassium;
  @override
  @JsonKey()
  @HiveField(18)
  final double sodium;
  @override
  @JsonKey()
  @HiveField(19)
  final double zinc;
  @override
  @JsonKey()
  @HiveField(20)
  final double copper;
  @override
  @JsonKey()
  @HiveField(21)
  final double retinol;
  @override
  @JsonKey()
  @HiveField(22)
  final double vitaminA;
  @override
  @JsonKey()
  @HiveField(23)
  final double vitaminE;
  @override
  @JsonKey()
  @HiveField(24)
  final double vitaminD;
  @override
  @JsonKey()
  @HiveField(25)
  final double vitaminC;
  @override
  @JsonKey()
  @HiveField(26)
  final double vitaminB6;
  @override
  @JsonKey()
  @HiveField(27)
  final double vitaminB12;
  @override
  @JsonKey()
  @HiveField(28)
  final double vitaminK;
  @override
  @JsonKey()
  @HiveField(29)
  final double thiamin;
  @override
  @JsonKey()
  @HiveField(30)
  final double niacin;

  @override
  String toString() {
    return 'Nutrients(amount: $amount, calories: $calories, fats: $fats, saturatedFats: $saturatedFats, cholesterol: $cholesterol, cabs: $cabs, fiber: $fiber, protein: $protein, salt: $salt, alcohol: $alcohol, water: $water, caffeine: $caffeine, sugars: $sugars, calcium: $calcium, iron: $iron, magnesium: $magnesium, phosphorus: $phosphorus, potassium: $potassium, sodium: $sodium, zinc: $zinc, copper: $copper, retinol: $retinol, vitaminA: $vitaminA, vitaminE: $vitaminE, vitaminD: $vitaminD, vitaminC: $vitaminC, vitaminB6: $vitaminB6, vitaminB12: $vitaminB12, vitaminK: $vitaminK, thiamin: $thiamin, niacin: $niacin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientsImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.saturatedFats, saturatedFats) ||
                other.saturatedFats == saturatedFats) &&
            (identical(other.cholesterol, cholesterol) ||
                other.cholesterol == cholesterol) &&
            (identical(other.cabs, cabs) || other.cabs == cabs) &&
            (identical(other.fiber, fiber) || other.fiber == fiber) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.salt, salt) || other.salt == salt) &&
            (identical(other.alcohol, alcohol) || other.alcohol == alcohol) &&
            (identical(other.water, water) || other.water == water) &&
            (identical(other.caffeine, caffeine) ||
                other.caffeine == caffeine) &&
            (identical(other.sugars, sugars) || other.sugars == sugars) &&
            (identical(other.calcium, calcium) || other.calcium == calcium) &&
            (identical(other.iron, iron) || other.iron == iron) &&
            (identical(other.magnesium, magnesium) ||
                other.magnesium == magnesium) &&
            (identical(other.phosphorus, phosphorus) ||
                other.phosphorus == phosphorus) &&
            (identical(other.potassium, potassium) ||
                other.potassium == potassium) &&
            (identical(other.sodium, sodium) || other.sodium == sodium) &&
            (identical(other.zinc, zinc) || other.zinc == zinc) &&
            (identical(other.copper, copper) || other.copper == copper) &&
            (identical(other.retinol, retinol) || other.retinol == retinol) &&
            (identical(other.vitaminA, vitaminA) ||
                other.vitaminA == vitaminA) &&
            (identical(other.vitaminE, vitaminE) ||
                other.vitaminE == vitaminE) &&
            (identical(other.vitaminD, vitaminD) ||
                other.vitaminD == vitaminD) &&
            (identical(other.vitaminC, vitaminC) ||
                other.vitaminC == vitaminC) &&
            (identical(other.vitaminB6, vitaminB6) ||
                other.vitaminB6 == vitaminB6) &&
            (identical(other.vitaminB12, vitaminB12) ||
                other.vitaminB12 == vitaminB12) &&
            (identical(other.vitaminK, vitaminK) ||
                other.vitaminK == vitaminK) &&
            (identical(other.thiamin, thiamin) || other.thiamin == thiamin) &&
            (identical(other.niacin, niacin) || other.niacin == niacin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        amount,
        calories,
        fats,
        saturatedFats,
        cholesterol,
        cabs,
        fiber,
        protein,
        salt,
        alcohol,
        water,
        caffeine,
        sugars,
        calcium,
        iron,
        magnesium,
        phosphorus,
        potassium,
        sodium,
        zinc,
        copper,
        retinol,
        vitaminA,
        vitaminE,
        vitaminD,
        vitaminC,
        vitaminB6,
        vitaminB12,
        vitaminK,
        thiamin,
        niacin
      ]);

  /// Create a copy of Nutrients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientsImplCopyWith<_$NutrientsImpl> get copyWith =>
      __$$NutrientsImplCopyWithImpl<_$NutrientsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutrientsImplToJson(
      this,
    );
  }
}

abstract class _Nutrients implements Nutrients {
  const factory _Nutrients(
      {@HiveField(0) final int amount,
      @HiveField(1) final int calories,
      @HiveField(2) final double fats,
      @HiveField(3) final double saturatedFats,
      @HiveField(4) final double cholesterol,
      @HiveField(5) final double cabs,
      @HiveField(6) final double fiber,
      @HiveField(7) final double protein,
      @HiveField(8) final double salt,
      @HiveField(9) final double alcohol,
      @HiveField(10) final double water,
      @HiveField(11) final double caffeine,
      @HiveField(12) final double sugars,
      @HiveField(13) final double calcium,
      @HiveField(14) final double iron,
      @HiveField(15) final double magnesium,
      @HiveField(16) final double phosphorus,
      @HiveField(17) final double potassium,
      @HiveField(18) final double sodium,
      @HiveField(19) final double zinc,
      @HiveField(20) final double copper,
      @HiveField(21) final double retinol,
      @HiveField(22) final double vitaminA,
      @HiveField(23) final double vitaminE,
      @HiveField(24) final double vitaminD,
      @HiveField(25) final double vitaminC,
      @HiveField(26) final double vitaminB6,
      @HiveField(27) final double vitaminB12,
      @HiveField(28) final double vitaminK,
      @HiveField(29) final double thiamin,
      @HiveField(30) final double niacin}) = _$NutrientsImpl;

  factory _Nutrients.fromJson(Map<String, dynamic> json) =
      _$NutrientsImpl.fromJson;

  @override
  @HiveField(0)
  int get amount;
  @override
  @HiveField(1)
  int get calories;
  @override
  @HiveField(2)
  double get fats;
  @override
  @HiveField(3)
  double get saturatedFats;
  @override
  @HiveField(4)
  double get cholesterol;
  @override
  @HiveField(5)
  double get cabs;
  @override
  @HiveField(6)
  double get fiber;
  @override
  @HiveField(7)
  double get protein;
  @override
  @HiveField(8)
  double get salt;
  @override
  @HiveField(9)
  double get alcohol;
  @override
  @HiveField(10)
  double get water;
  @override
  @HiveField(11)
  double get caffeine;
  @override
  @HiveField(12)
  double get sugars;
  @override
  @HiveField(13)
  double get calcium;
  @override
  @HiveField(14)
  double get iron;
  @override
  @HiveField(15)
  double get magnesium;
  @override
  @HiveField(16)
  double get phosphorus;
  @override
  @HiveField(17)
  double get potassium;
  @override
  @HiveField(18)
  double get sodium;
  @override
  @HiveField(19)
  double get zinc;
  @override
  @HiveField(20)
  double get copper;
  @override
  @HiveField(21)
  double get retinol;
  @override
  @HiveField(22)
  double get vitaminA;
  @override
  @HiveField(23)
  double get vitaminE;
  @override
  @HiveField(24)
  double get vitaminD;
  @override
  @HiveField(25)
  double get vitaminC;
  @override
  @HiveField(26)
  double get vitaminB6;
  @override
  @HiveField(27)
  double get vitaminB12;
  @override
  @HiveField(28)
  double get vitaminK;
  @override
  @HiveField(29)
  double get thiamin;
  @override
  @HiveField(30)
  double get niacin;

  /// Create a copy of Nutrients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientsImplCopyWith<_$NutrientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) {
  return _RecipeStep.fromJson(json);
}

/// @nodoc
mixin _$RecipeStep {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;

  /// Serializes this RecipeStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeStepCopyWith<RecipeStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStepCopyWith<$Res> {
  factory $RecipeStepCopyWith(
          RecipeStep value, $Res Function(RecipeStep) then) =
      _$RecipeStepCopyWithImpl<$Res, RecipeStep>;
  @useResult
  $Res call(
      {int id, String description, int position, int time, String picture});
}

/// @nodoc
class _$RecipeStepCopyWithImpl<$Res, $Val extends RecipeStep>
    implements $RecipeStepCopyWith<$Res> {
  _$RecipeStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? position = null,
    Object? time = null,
    Object? picture = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeStepImplCopyWith<$Res>
    implements $RecipeStepCopyWith<$Res> {
  factory _$$RecipeStepImplCopyWith(
          _$RecipeStepImpl value, $Res Function(_$RecipeStepImpl) then) =
      __$$RecipeStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String description, int position, int time, String picture});
}

/// @nodoc
class __$$RecipeStepImplCopyWithImpl<$Res>
    extends _$RecipeStepCopyWithImpl<$Res, _$RecipeStepImpl>
    implements _$$RecipeStepImplCopyWith<$Res> {
  __$$RecipeStepImplCopyWithImpl(
      _$RecipeStepImpl _value, $Res Function(_$RecipeStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? position = null,
    Object? time = null,
    Object? picture = null,
  }) {
    return _then(_$RecipeStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeStepImpl implements _RecipeStep {
  const _$RecipeStepImpl(
      {required this.id,
      this.description = 'No description available',
      this.position = 0,
      this.time = 0,
      this.picture = ''});

  factory _$RecipeStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeStepImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int position;
  @override
  @JsonKey()
  final int time;
  @override
  @JsonKey()
  final String picture;

  @override
  String toString() {
    return 'RecipeStep(id: $id, description: $description, position: $position, time: $time, picture: $picture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, position, time, picture);

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeStepImplCopyWith<_$RecipeStepImpl> get copyWith =>
      __$$RecipeStepImplCopyWithImpl<_$RecipeStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeStepImplToJson(
      this,
    );
  }
}

abstract class _RecipeStep implements RecipeStep {
  const factory _RecipeStep(
      {required final int id,
      final String description,
      final int position,
      final int time,
      final String picture}) = _$RecipeStepImpl;

  factory _RecipeStep.fromJson(Map<String, dynamic> json) =
      _$RecipeStepImpl.fromJson;

  @override
  int get id;
  @override
  String get description;
  @override
  int get position;
  @override
  int get time;
  @override
  String get picture;

  /// Create a copy of RecipeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeStepImplCopyWith<_$RecipeStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeProduct _$RecipeProductFromJson(Map<String, dynamic> json) {
  return _RecipeProduct.fromJson(json);
}

/// @nodoc
mixin _$RecipeProduct {
  int? get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get ingredientName => throw _privateConstructorUsedError;
  UnitOfMeasure? get unitOfMeasure => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;

  /// Serializes this RecipeProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeProductCopyWith<RecipeProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeProductCopyWith<$Res> {
  factory $RecipeProductCopyWith(
          RecipeProduct value, $Res Function(RecipeProduct) then) =
      _$RecipeProductCopyWithImpl<$Res, RecipeProduct>;
  @useResult
  $Res call(
      {int? id,
      double amount,
      String text,
      String ingredientName,
      UnitOfMeasure? unitOfMeasure,
      ProductModel? product});

  $UnitOfMeasureCopyWith<$Res>? get unitOfMeasure;
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$RecipeProductCopyWithImpl<$Res, $Val extends RecipeProduct>
    implements $RecipeProductCopyWith<$Res> {
  _$RecipeProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = null,
    Object? text = null,
    Object? ingredientName = null,
    Object? unitOfMeasure = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      ingredientName: null == ingredientName
          ? _value.ingredientName
          : ingredientName // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasure: freezed == unitOfMeasure
          ? _value.unitOfMeasure
          : unitOfMeasure // ignore: cast_nullable_to_non_nullable
              as UnitOfMeasure?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ) as $Val);
  }

  /// Create a copy of RecipeProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnitOfMeasureCopyWith<$Res>? get unitOfMeasure {
    if (_value.unitOfMeasure == null) {
      return null;
    }

    return $UnitOfMeasureCopyWith<$Res>(_value.unitOfMeasure!, (value) {
      return _then(_value.copyWith(unitOfMeasure: value) as $Val);
    });
  }

  /// Create a copy of RecipeProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeProductImplCopyWith<$Res>
    implements $RecipeProductCopyWith<$Res> {
  factory _$$RecipeProductImplCopyWith(
          _$RecipeProductImpl value, $Res Function(_$RecipeProductImpl) then) =
      __$$RecipeProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      double amount,
      String text,
      String ingredientName,
      UnitOfMeasure? unitOfMeasure,
      ProductModel? product});

  @override
  $UnitOfMeasureCopyWith<$Res>? get unitOfMeasure;
  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$RecipeProductImplCopyWithImpl<$Res>
    extends _$RecipeProductCopyWithImpl<$Res, _$RecipeProductImpl>
    implements _$$RecipeProductImplCopyWith<$Res> {
  __$$RecipeProductImplCopyWithImpl(
      _$RecipeProductImpl _value, $Res Function(_$RecipeProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = null,
    Object? text = null,
    Object? ingredientName = null,
    Object? unitOfMeasure = freezed,
    Object? product = freezed,
  }) {
    return _then(_$RecipeProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      ingredientName: null == ingredientName
          ? _value.ingredientName
          : ingredientName // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasure: freezed == unitOfMeasure
          ? _value.unitOfMeasure
          : unitOfMeasure // ignore: cast_nullable_to_non_nullable
              as UnitOfMeasure?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecipeProductImpl implements _RecipeProduct {
  const _$RecipeProductImpl(
      {required this.id,
      this.amount = 0.0,
      this.text = 'No text available',
      this.ingredientName = 'Unknown ingredient',
      this.unitOfMeasure,
      this.product});

  factory _$RecipeProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeProductImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final String ingredientName;
  @override
  final UnitOfMeasure? unitOfMeasure;
  @override
  final ProductModel? product;

  @override
  String toString() {
    return 'RecipeProduct(id: $id, amount: $amount, text: $text, ingredientName: $ingredientName, unitOfMeasure: $unitOfMeasure, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.ingredientName, ingredientName) ||
                other.ingredientName == ingredientName) &&
            (identical(other.unitOfMeasure, unitOfMeasure) ||
                other.unitOfMeasure == unitOfMeasure) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, amount, text, ingredientName, unitOfMeasure, product);

  /// Create a copy of RecipeProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeProductImplCopyWith<_$RecipeProductImpl> get copyWith =>
      __$$RecipeProductImplCopyWithImpl<_$RecipeProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeProductImplToJson(
      this,
    );
  }
}

abstract class _RecipeProduct implements RecipeProduct {
  const factory _RecipeProduct(
      {required final int? id,
      final double amount,
      final String text,
      final String ingredientName,
      final UnitOfMeasure? unitOfMeasure,
      final ProductModel? product}) = _$RecipeProductImpl;

  factory _RecipeProduct.fromJson(Map<String, dynamic> json) =
      _$RecipeProductImpl.fromJson;

  @override
  int? get id;
  @override
  double get amount;
  @override
  String get text;
  @override
  String get ingredientName;
  @override
  UnitOfMeasure? get unitOfMeasure;
  @override
  ProductModel? get product;

  /// Create a copy of RecipeProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeProductImplCopyWith<_$RecipeProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UnitOfMeasure _$UnitOfMeasureFromJson(Map<String, dynamic> json) {
  return _UnitOfMeasure.fromJson(json);
}

/// @nodoc
mixin _$UnitOfMeasure {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this UnitOfMeasure to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnitOfMeasure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnitOfMeasureCopyWith<UnitOfMeasure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitOfMeasureCopyWith<$Res> {
  factory $UnitOfMeasureCopyWith(
          UnitOfMeasure value, $Res Function(UnitOfMeasure) then) =
      _$UnitOfMeasureCopyWithImpl<$Res, UnitOfMeasure>;
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class _$UnitOfMeasureCopyWithImpl<$Res, $Val extends UnitOfMeasure>
    implements $UnitOfMeasureCopyWith<$Res> {
  _$UnitOfMeasureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnitOfMeasure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitOfMeasureImplCopyWith<$Res>
    implements $UnitOfMeasureCopyWith<$Res> {
  factory _$$UnitOfMeasureImplCopyWith(
          _$UnitOfMeasureImpl value, $Res Function(_$UnitOfMeasureImpl) then) =
      __$$UnitOfMeasureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class __$$UnitOfMeasureImplCopyWithImpl<$Res>
    extends _$UnitOfMeasureCopyWithImpl<$Res, _$UnitOfMeasureImpl>
    implements _$$UnitOfMeasureImplCopyWith<$Res> {
  __$$UnitOfMeasureImplCopyWithImpl(
      _$UnitOfMeasureImpl _value, $Res Function(_$UnitOfMeasureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitOfMeasure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$UnitOfMeasureImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UnitOfMeasureImpl implements _UnitOfMeasure {
  const _$UnitOfMeasureImpl({required this.id, this.name});

  factory _$UnitOfMeasureImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitOfMeasureImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;

  @override
  String toString() {
    return 'UnitOfMeasure(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitOfMeasureImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of UnitOfMeasure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitOfMeasureImplCopyWith<_$UnitOfMeasureImpl> get copyWith =>
      __$$UnitOfMeasureImplCopyWithImpl<_$UnitOfMeasureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitOfMeasureImplToJson(
      this,
    );
  }
}

abstract class _UnitOfMeasure implements UnitOfMeasure {
  const factory _UnitOfMeasure({required final int id, final String? name}) =
      _$UnitOfMeasureImpl;

  factory _UnitOfMeasure.fromJson(Map<String, dynamic> json) =
      _$UnitOfMeasureImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;

  /// Create a copy of UnitOfMeasure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnitOfMeasureImplCopyWith<_$UnitOfMeasureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
