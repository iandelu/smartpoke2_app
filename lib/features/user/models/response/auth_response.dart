import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/features/user/models/user/user_models.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse{
  const factory AuthResponse({
    required String token,
    required UserModel user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}