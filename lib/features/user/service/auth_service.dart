import 'package:dio/dio.dart';
import 'package:meal_ai/config/connections/smartpoke_client.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/user/models/auth_request.dart';

class AuthService {
  String path = 'auth';

  Future<String> login(LoginRequest loginRequest) async{
    final response = await smartPokeClient.post('$path/login', data: loginRequest.toJson());
    if(response.statusCode == 200) {
      return response.data['token'];
    } else {
      logger.d(response.statusCode);
      throw Exception('Failed to login');
    }

  }

  Future<String> signUp(RegisterRequest registerRequest) async{
    final response = await smartPokeClient.post('$path/register', data: registerRequest.toJson());
    if(response.statusCode == 200) {
      return response.data['token'];
    } else {
      logger.d(response.statusCode);
      throw Exception('Failed to login');
    }
  }
}
