// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      picture: json['picture'] as String?,
      email: json['email'] as String,
      verify: json['verify'] as bool,
      premium: json['premium'] as bool,
      role: json['role'] as String,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      userinfo: json['userinfo'] == null
          ? null
          : Userinfo.fromJson(json['userinfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'picture': instance.picture,
      'email': instance.email,
      'verify': instance.verify,
      'premium': instance.premium,
      'role': instance.role,
      'location': instance.location?.toJson(),
      'userinfo': instance.userinfo?.toJson(),
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
      sex: (json['sex'] as num).toInt(),
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      birthdate: DateTime.parse(json['birthdate'] as String),
    );

Map<String, dynamic> _$$UserinfoImplToJson(_$UserinfoImpl instance) =>
    <String, dynamic>{
      'sex': instance.sex,
      'height': instance.height,
      'weight': instance.weight,
      'birthdate': instance.birthdate.toIso8601String(),
    };
