// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      picture: json['picture'] as String,
      email: json['email'] as String,
      verify: json['verify'] as bool,
      premium: json['premium'] as bool,
      role: json['role'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      userinfo: Userinfo.fromJson(json['userinfo'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool,
      username: json['username'] as String,
      authorities: (json['authorities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      accountNonExpired: json['accountNonExpired'] as bool,
      credentialsNonExpired: json['credentialsNonExpired'] as bool,
      accountNonLocked: json['accountNonLocked'] as bool,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'picture': instance.picture,
      'email': instance.email,
      'verify': instance.verify,
      'premium': instance.premium,
      'role': instance.role,
      'location': instance.location.toJson(),
      'userinfo': instance.userinfo.toJson(),
      'enabled': instance.enabled,
      'username': instance.username,
      'authorities': instance.authorities,
      'accountNonExpired': instance.accountNonExpired,
      'credentialsNonExpired': instance.credentialsNonExpired,
      'accountNonLocked': instance.accountNonLocked,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$UserinfoImpl _$$UserinfoImplFromJson(Map<String, dynamic> json) =>
    _$UserinfoImpl(
      id: (json['id'] as num).toInt(),
      sex: (json['sex'] as num).toInt(),
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      birthdate: DateTime.parse(json['birthdate'] as String),
    );

Map<String, dynamic> _$$UserinfoImplToJson(_$UserinfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sex': instance.sex,
      'height': instance.height,
      'weight': instance.weight,
      'birthdate': instance.birthdate.toIso8601String(),
    };
