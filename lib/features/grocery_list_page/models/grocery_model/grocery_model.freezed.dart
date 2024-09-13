// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grocery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroceryModel _$GroceryModelFromJson(Map<String, dynamic> json) {
  return _GroceryModel.fromJson(json);
}

/// @nodoc
mixin _$GroceryModel {
  RecipeProduct get groceryItem => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;
  dynamic get key => throw _privateConstructorUsedError;

  /// Serializes this GroceryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroceryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroceryModelCopyWith<GroceryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceryModelCopyWith<$Res> {
  factory $GroceryModelCopyWith(
          GroceryModel value, $Res Function(GroceryModel) then) =
      _$GroceryModelCopyWithImpl<$Res, GroceryModel>;
  @useResult
  $Res call({RecipeProduct groceryItem, bool isChecked, dynamic key});

  $RecipeProductCopyWith<$Res> get groceryItem;
}

/// @nodoc
class _$GroceryModelCopyWithImpl<$Res, $Val extends GroceryModel>
    implements $GroceryModelCopyWith<$Res> {
  _$GroceryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroceryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groceryItem = null,
    Object? isChecked = null,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      groceryItem: null == groceryItem
          ? _value.groceryItem
          : groceryItem // ignore: cast_nullable_to_non_nullable
              as RecipeProduct,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of GroceryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecipeProductCopyWith<$Res> get groceryItem {
    return $RecipeProductCopyWith<$Res>(_value.groceryItem, (value) {
      return _then(_value.copyWith(groceryItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroceryModelImplCopyWith<$Res>
    implements $GroceryModelCopyWith<$Res> {
  factory _$$GroceryModelImplCopyWith(
          _$GroceryModelImpl value, $Res Function(_$GroceryModelImpl) then) =
      __$$GroceryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RecipeProduct groceryItem, bool isChecked, dynamic key});

  @override
  $RecipeProductCopyWith<$Res> get groceryItem;
}

/// @nodoc
class __$$GroceryModelImplCopyWithImpl<$Res>
    extends _$GroceryModelCopyWithImpl<$Res, _$GroceryModelImpl>
    implements _$$GroceryModelImplCopyWith<$Res> {
  __$$GroceryModelImplCopyWithImpl(
      _$GroceryModelImpl _value, $Res Function(_$GroceryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroceryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groceryItem = null,
    Object? isChecked = null,
    Object? key = freezed,
  }) {
    return _then(_$GroceryModelImpl(
      groceryItem: null == groceryItem
          ? _value.groceryItem
          : groceryItem // ignore: cast_nullable_to_non_nullable
              as RecipeProduct,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$GroceryModelImpl implements _GroceryModel {
  const _$GroceryModelImpl(
      {required this.groceryItem, required this.isChecked, required this.key});

  factory _$GroceryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroceryModelImplFromJson(json);

  @override
  final RecipeProduct groceryItem;
  @override
  final bool isChecked;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'GroceryModel(groceryItem: $groceryItem, isChecked: $isChecked, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceryModelImpl &&
            (identical(other.groceryItem, groceryItem) ||
                other.groceryItem == groceryItem) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            const DeepCollectionEquality().equals(other.key, key));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groceryItem, isChecked,
      const DeepCollectionEquality().hash(key));

  /// Create a copy of GroceryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroceryModelImplCopyWith<_$GroceryModelImpl> get copyWith =>
      __$$GroceryModelImplCopyWithImpl<_$GroceryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroceryModelImplToJson(
      this,
    );
  }
}

abstract class _GroceryModel implements GroceryModel {
  const factory _GroceryModel(
      {required final RecipeProduct groceryItem,
      required final bool isChecked,
      required final dynamic key}) = _$GroceryModelImpl;

  factory _GroceryModel.fromJson(Map<String, dynamic> json) =
      _$GroceryModelImpl.fromJson;

  @override
  RecipeProduct get groceryItem;
  @override
  bool get isChecked;
  @override
  dynamic get key;

  /// Create a copy of GroceryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroceryModelImplCopyWith<_$GroceryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
