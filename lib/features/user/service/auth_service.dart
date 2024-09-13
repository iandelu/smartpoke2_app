import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/config/connections/smartpoke_client.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/user/models/auth_request.dart';
import 'package:meal_ai/features/user/models/response/auth_response.dart';

class AuthService {
  String path = 'auth';

  Future<AuthResponse> login(LoginRequest loginRequest) async{
    final response = await smartPokeClient.post('$path/login', data: loginRequest.toJson());
    if(response.statusCode == 200) {
      return AuthResponse.fromJson(response.data);
    } else {
      logger.d(response.statusCode);
      throw Exception('Failed to login');
    }

  }

  Future<AuthResponse> signUp(RegisterRequest registerRequest) async{
    final response = await smartPokeClient.post('$path/register', data: registerRequest.toJson());
    if(response.statusCode == 200) {
      return AuthResponse.fromJson(response.data);
    } else {
      logger.d(response.statusCode);
      throw Exception('Failed to login');
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());