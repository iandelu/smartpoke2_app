// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get verify => throw _privateConstructorUsedError;
  bool get premium => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  Userinfo? get userinfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
      String? firstName,
      String? lastName,
      String? picture,
      String email,
      bool verify,
      bool premium,
      String role,
      Location? location,
      Userinfo? userinfo});

  $LocationCopyWith<$Res>? get location;
  $UserinfoCopyWith<$Res>? get userinfo;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? picture = freezed,
    Object? email = null,
    Object? verify = null,
    Object? premium = null,
    Object? role = null,
    Object? location = freezed,
    Object? userinfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verify: null == verify
          ? _value.verify
          : verify // ignore: cast_nullable_to_non_nullable
              as bool,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      userinfo: freezed == userinfo
          ? _value.userinfo
          : userinfo // ignore: cast_nullable_to_non_nullable
              as Userinfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserinfoCopyWith<$Res>? get userinfo {
    if (_value.userinfo == null) {
      return null;
    }

    return $UserinfoCopyWith<$Res>(_value.userinfo!, (value) {
      return _then(_value.copyWith(userinfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? firstName,
      String? lastName,
      String? picture,
      String email,
      bool verify,
      bool premium,
      String role,
      Location? location,
      Userinfo? userinfo});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $UserinfoCopyWith<$Res>? get userinfo;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? picture = freezed,
    Object? email = null,
    Object? verify = null,
    Object? premium = null,
    Object? role = null,
    Object? location = freezed,
    Object? userinfo = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verify: null == verify
          ? _value.verify
          : verify // ignore: cast_nullable_to_non_nullable
              as bool,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      userinfo: freezed == userinfo
          ? _value.userinfo
          : userinfo // ignore: cast_nullable_to_non_nullable
              as Userinfo?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.id,
      this.firstName,
      this.lastName,
      this.picture,
      required this.email,
      required this.verify,
      required this.premium,
      required this.role,
      this.location,
      this.userinfo});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? picture;
  @override
  final String email;
  @override
  final bool verify;
  @override
  final bool premium;
  @override
  final String role;
  @override
  final Location? location;
  @override
  final Userinfo? userinfo;

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, picture: $picture, email: $email, verify: $verify, premium: $premium, role: $role, location: $location, userinfo: $userinfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.verify, verify) || other.verify == verify) &&
            (identical(other.premium, premium) || other.premium == premium) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.userinfo, userinfo) ||
                other.userinfo == userinfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, picture,
      email, verify, premium, role, location, userinfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final int id,
      final String? firstName,
      final String? lastName,
      final String? picture,
      required final String email,
      required final bool verify,
      required final bool premium,
      required final String role,
      final Location? location,
      final Userinfo? userinfo}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get picture;
  @override
  String get email;
  @override
  bool get verify;
  @override
  bool get premium;
  @override
  String get role;
  @override
  Location? get location;
  @override
  Userinfo? get userinfo;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$LocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LocationImpl implements _Location {
  const _$LocationImpl({required this.id, required this.name});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Location(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location({required final int id, required final String name}) =
      _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Userinfo _$UserinfoFromJson(Map<String, dynamic> json) {
  return _Userinfo.fromJson(json);
}

/// @nodoc
mixin _$Userinfo {
  int get sex => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  DateTime get birthdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserinfoCopyWith<Userinfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserinfoCopyWith<$Res> {
  factory $UserinfoCopyWith(Userinfo value, $Res Function(Userinfo) then) =
      _$UserinfoCopyWithImpl<$Res, Userinfo>;
  @useResult
  $Res call({int sex, double height, double weight, DateTime birthdate});
}

/// @nodoc
class _$UserinfoCopyWithImpl<$Res, $Val extends Userinfo>
    implements $UserinfoCopyWith<$Res> {
  _$UserinfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sex = null,
    Object? height = null,
    Object? weight = null,
    Object? birthdate = null,
  }) {
    return _then(_value.copyWith(
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserinfoImplCopyWith<$Res>
    implements $UserinfoCopyWith<$Res> {
  factory _$$UserinfoImplCopyWith(
          _$UserinfoImpl value, $Res Function(_$UserinfoImpl) then) =
      __$$UserinfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sex, double height, double weight, DateTime birthdate});
}

/// @nodoc
class __$$UserinfoImplCopyWithImpl<$Res>
    extends _$UserinfoCopyWithImpl<$Res, _$UserinfoImpl>
    implements _$$UserinfoImplCopyWith<$Res> {
  __$$UserinfoImplCopyWithImpl(
      _$UserinfoImpl _value, $Res Function(_$UserinfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sex = null,
    Object? height = null,
    Object? weight = null,
    Object? birthdate = null,
  }) {
    return _then(_$UserinfoImpl(
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserinfoImpl implements _Userinfo {
  const _$UserinfoImpl(
      {required this.sex,
      required this.height,
      required this.weight,
      required this.birthdate});

  factory _$UserinfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserinfoImplFromJson(json);

  @override
  final int sex;
  @override
  final double height;
  @override
  final double weight;
  @override
  final DateTime birthdate;

  @override
  String toString() {
    return 'Userinfo(sex: $sex, height: $height, weight: $weight, birthdate: $birthdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserinfoImpl &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sex, height, weight, birthdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserinfoImplCopyWith<_$UserinfoImpl> get copyWith =>
      __$$UserinfoImplCopyWithImpl<_$UserinfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserinfoImplToJson(
      this,
    );
  }
}

abstract class _Userinfo implements Userinfo {
  const factory _Userinfo(
      {required final int sex,
      required final double height,
      required final double weight,
      required final DateTime birthdate}) = _$UserinfoImpl;

  factory _Userinfo.fromJson(Map<String, dynamic> json) =
      _$UserinfoImpl.fromJson;

  @override
  int get sex;
  @override
  double get height;
  @override
  double get weight;
  @override
  DateTime get birthdate;
  @override
  @JsonKey(ignore: true)
  _$$UserinfoImplCopyWith<_$UserinfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
