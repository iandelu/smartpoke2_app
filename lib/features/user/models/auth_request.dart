import 'package:meal_ai/features/user/models/user/user_models.dart';

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class RegisterRequest {
  final String password;
  final String? firstName;
  final String? lastName;
  final String email;
  final Location? location;
  final Userinfo? userInfo;

  RegisterRequest({
    required this.password,
    this.firstName,
    this.lastName,
    required this.email,
    this.location,
    this.userInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'locationDto': location?.toJson(),
      'userInfoDto': userInfo?.toJson(),
    };
  }
}
