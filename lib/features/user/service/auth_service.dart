import 'package:dio/dio.dart';
import 'package:meal_ai/config/connections/smartpoke_client.dart';
import 'package:meal_ai/core/utils/logger.dart';
import 'package:meal_ai/features/user/models/auth_request.dart';

class AuthService {
  String path = '/auth';

  Future<String> login(LoginRequest loginRequest) async{
    try {
      final response = await smartPokeClient.post('$path/login', data: loginRequest.toJson());
      if(response.statusCode == 200) {
        return response.data['token'];
      } else {
        logger.d(response.statusCode);
        throw Exception('Failed to login');
      }
    } on Exception catch (e, st) {
      logger.d('Error', error: e, stackTrace: st);
      throw Exception('Error: $e');
    }
  }

  Future<String> register(RegisterRequest registerRequest) async{
    try {
      final response = await smartPokeClient.post('$path/register', data: registerRequest.toJson());
      if(response.statusCode == 200) {
        return response.data['token'];
      } else {
        logger.d(response.statusCode);
        throw Exception('Failed to login');
      }
    } catch (e, st) {
      logger.d('Error', error: e, stackTrace: st);
      throw Exception('Error: $e');
    }
  }
}
