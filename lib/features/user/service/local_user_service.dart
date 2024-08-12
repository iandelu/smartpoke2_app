import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/features/user/models/response/auth_response.dart';
import 'package:meal_ai/features/user/models/user/user_models.dart';

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

final setAuthStateProvider = StateProvider<AuthResponse?>(
      (ref) => null,
);

final setIsAuthenticatedProvider = StateProvider.family<void, bool>(
      (ref, isAuth) async {
    final box = await ref.watch(hiveBoxProvider.future);
    ref.watch(setAuthStateProvider);
    box.put(
      IS_AUTHENTICATED_KEY,
      isAuth,
    );
  },
);

final setAuthenticatedUserProvider = StateProvider.family<void, UserModel>(
      (ref, userdata) async {
    final box = await ref.watch(hiveBoxProvider.future);
    ref.watch(setAuthStateProvider);
    box.put(
      AUTHENTICATED_USER_EMAIL_KEY,
      json.encode(userdata),
    );
  },
);

final setJwtProvider = StateProvider.family<void, String>(
      (ref, token) async {
    final box = await ref.watch(hiveBoxProvider.future);
    box.put(JWT_KEY, token);
  },
);

final getIsAuthenticatedProvider = FutureProvider<bool>(
      (ref) async {
    final box = await ref.watch(hiveBoxProvider.future);
    ref.watch(setAuthStateProvider);
    return box.get(IS_AUTHENTICATED_KEY, defaultValue: false);
  },
);

final getAuthenticatedUserProvider = FutureProvider<UserModel>(
      (ref) async {
    final box = await ref.watch(hiveBoxProvider.future);
    ref.watch(setAuthStateProvider);
    dynamic user =
    json.decode(box.get(AUTHENTICATED_USER_EMAIL_KEY) ?? "");
    return UserModel.fromJson(user);
  },
);

final getJwtProvider = FutureProvider<String?>(
      (ref) async {
    final box = await ref.watch(hiveBoxProvider.future);
    return box.get(JWT_KEY);
  },
);

final deleteJwtProvider = StateProvider<void>(
      (ref) async {
    final box = await ref.watch(hiveBoxProvider.future);
    await box.delete(JWT_KEY);
  },
);

final resetStorage = StateProvider<dynamic>(
      (ref) async {
    final box = await ref.watch(hiveBoxProvider.future);
    final isCleared = await box.clear();
    return isCleared;
  },
);
