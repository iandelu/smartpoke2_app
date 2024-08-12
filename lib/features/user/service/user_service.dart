import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/config/connections/smartpoke_client.dart';
import 'package:meal_ai/features/user/models/user/user_models.dart';

class SmartPokeUserDatasource {
  final String path = '/user';

  Future<UserModel> getMyUser() async {
    final response = await smartPokeClient.get('$path/me');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<UserModel> updateUser(int id, UserModel user) async {
    final response = await smartPokeClient.put(
      '$path/$id',
      data: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await smartPokeClient.delete('$path/$id');

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }

  }
}

final userRepositoryProvider = Provider<SmartPokeUserDatasource>((ref) => SmartPokeUserDatasource());
