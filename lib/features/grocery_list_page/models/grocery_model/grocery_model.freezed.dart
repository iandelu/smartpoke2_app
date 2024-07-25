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
  String get groceryName => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;
  dynamic get key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroceryModelCopyWith<GroceryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceryModelCopyWith<$Res> {
  factory $GroceryModelCopyWith(
          GroceryModel value, $Res Function(GroceryModel) then) =
      _$GroceryModelCopyWithImpl<$Res, GroceryModel>;
  @useResult
  $Res call({String groceryName, bool isChecked, dynamic key});
}

/// @nodoc
class _$GroceryModelCopyWithImpl<$Res, $Val extends GroceryModel>
    implements $GroceryModelCopyWith<$Res> {
  _$GroceryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groceryName = null,
    Object? isChecked = null,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      groceryName: null == groceryName
          ? _value.groceryName
          : groceryName // ignore: cast_nullable_to_non_nullable
              as String,
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
}

/// @nodoc
abstract class _$$GroceryModelImplCopyWith<$Res>
    implements $GroceryModelCopyWith<$Res> {
  factory _$$GroceryModelImplCopyWith(
          _$GroceryModelImpl value, $Res Function(_$GroceryModelImpl) then) =
      __$$GroceryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groceryName, bool isChecked, dynamic key});
}

/// @nodoc
class __$$GroceryModelImplCopyWithImpl<$Res>
    extends _$GroceryModelCopyWithImpl<$Res, _$GroceryModelImpl>
    implements _$$GroceryModelImplCopyWith<$Res> {
  __$$GroceryModelImplCopyWithImpl(
      _$GroceryModelImpl _value, $Res Function(_$GroceryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groceryName = null,
    Object? isChecked = null,
    Object? key = freezed,
  }) {
    return _then(_$GroceryModelImpl(
      groceryName: null == groceryName
          ? _value.groceryName
          : groceryName // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$GroceryModelImpl implements _GroceryModel {
  const _$GroceryModelImpl(
      {required this.groceryName, required this.isChecked, required this.key});

  factory _$GroceryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroceryModelImplFromJson(json);

  @override
  final String groceryName;
  @override
  final bool isChecked;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'GroceryModel(groceryName: $groceryName, isChecked: $isChecked, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceryModelImpl &&
            (identical(other.groceryName, groceryName) ||
                other.groceryName == groceryName) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            const DeepCollectionEquality().equals(other.key, key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, groceryName, isChecked,
      const DeepCollectionEquality().hash(key));

  @JsonKey(ignore: true)
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
      {required final String groceryName,
      required final bool isChecked,
      required final dynamic key}) = _$GroceryModelImpl;

  factory _GroceryModel.fromJson(Map<String, dynamic> json) =
      _$GroceryModelImpl.fromJson;

  @override
  String get groceryName;
  @override
  bool get isChecked;
  @override
  dynamic get key;
  @override
  @JsonKey(ignore: true)
  _$$GroceryModelImplCopyWith<_$GroceryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
