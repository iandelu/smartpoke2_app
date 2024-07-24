import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    required int id,
    required String password,
    required String firstName,
    required String lastName,
    required String picture,
    required String email,
    required bool verify,
    required bool premium,
    required String role,
    required Location location,
    required Userinfo userinfo,
    required bool enabled,
    required String username,
    required List<String> authorities,
    required bool accountNonExpired,
    required bool credentialsNonExpired,
    required bool accountNonLocked,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class Location with _$Location {
  @JsonSerializable(explicitToJson: true)
  const factory Location({
    required int id,
    required String name,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
class Userinfo with _$Userinfo {
  @JsonSerializable(explicitToJson: true)
  const factory Userinfo({
    required int id,
    required int sex,
    required double height,
    required double weight,
    required DateTime birthdate,
  }) = _Userinfo;

  factory Userinfo.fromJson(Map<String, dynamic> json) => _$UserinfoFromJson(json);
}