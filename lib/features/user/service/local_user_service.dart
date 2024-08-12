import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/features/user/models/response/auth_response.dart';
import 'package:meal_ai/features/user/models/user/user_models.dart';
import 'package:meal_ai/features/user/service/user_service.dart';

import 'auth_service.dart';

const IS_AUTHENTICATED_KEY = 'IS_AUTHENTICATED_KEY';
const AUTHENTICATED_USER_EMAIL_KEY = 'AUTHENTICATED_USER_EMAIL_KEY';
const JWT_KEY = 'JWT_KEY';

final hiveProvider = Provider((_) async {
  await Hive.initFlutter();
  return Hive;
});

final hiveBoxProvider = FutureProvider<Box>((ref) async {
  final hive = await ref.watch(hiveProvider);
  return await hive.openBox('authBox');
});

class AuthState extends StateNotifier<AuthResponse?> {
  final Box _box;
  final SmartPokeUserDatasource _apiClient;

  AuthState(this._box, this._apiClient) : super(null) {
    _loadFromHive();
  }

  bool get isAuthenticated => _box.get(IS_AUTHENTICATED_KEY, defaultValue: false);
  String? get jwt => _box.get(JWT_KEY);
  UserModel? get userModel => _box.get(AUTHENTICATED_USER_EMAIL_KEY) != null
      ? UserModel.fromJson(json.decode(_box.get(AUTHENTICATED_USER_EMAIL_KEY)))
      : null;

  Future<void> setAuthenticated(bool isAuth) async {
    await _box.put(IS_AUTHENTICATED_KEY, isAuth);
    state = state?.copyWith(isAuthenticated: isAuth);
  }

  Future<void> setUser(UserModel user) async {
    await _box.put(AUTHENTICATED_USER_EMAIL_KEY, json.encode(user));
    await _apiClient.updateUser(user.id, user);
    state = state?.copyWith(user: user);
  }

  Future<void> setJwt(String token) async {
    await _box.put(JWT_KEY, token);

    state = state?.copyWith(token: token);
  }

  Future<void> _loadFromHive() async {
    final isAuth = _box.get(IS_AUTHENTICATED_KEY, defaultValue: false);
    final token = _box.get(JWT_KEY);
    final user = _box.get(AUTHENTICATED_USER_EMAIL_KEY) != null
        ? UserModel.fromJson(json.decode(_box.get(AUTHENTICATED_USER_EMAIL_KEY)))
        : null;
    state = AuthResponse(isAuthenticated: isAuth, token: token, user: user);
  }

  Future<bool> logout() async {
    try {
      await _box.delete(JWT_KEY);
      await _box.delete(AUTHENTICATED_USER_EMAIL_KEY);
      await _box.put(IS_AUTHENTICATED_KEY, false);
      state = const AuthResponse(isAuthenticated: false, token: null, user: null);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}

final authStateProvider = StateNotifierProvider<AuthState, AuthResponse?>((ref) {
  final box = ref.watch(hiveBoxProvider).asData!.value;
  final apiClient = ref.watch(userRepositoryProvider);
  return AuthState(box, apiClient);
});