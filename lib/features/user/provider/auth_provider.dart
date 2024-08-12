import 'package:dartz/dartz.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meal_ai/features/user/models/auth_request.dart';
import 'package:meal_ai/features/user/service/auth_service.dart';
import 'package:meal_ai/features/user/service/local_user_service.dart';


class UserController extends StateNotifier<AsyncValue<dynamic>> {
  Ref ref;

  UserController({
    required this.ref,
  }) : super(const AsyncData(null));

  Future<Either<String, bool>> login(
      {required String email, required String password}) async {
    state = const AsyncLoading();

    LoginRequest userReq = LoginRequest(email: email, password: password);
    try {
      final response = await ref.read(authServiceProvider).login(userReq);
      ref.read(setAuthStateProvider.notifier).state = response;
      ref.read(setIsAuthenticatedProvider(true));
      ref.read(setAuthenticatedUserProvider(response.user));
      return const Right(true);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> signup(
      {required String email, required String password}) async {
    state = const AsyncLoading();

    RegisterRequest userReq = RegisterRequest(email: email, password: password);
    try {
      final response = await ref.read(authServiceProvider).signUp(userReq);
      ref.read(setAuthStateProvider.notifier).state = response;
      ref.read(setIsAuthenticatedProvider(true));
      ref.read(setAuthenticatedUserProvider(response.user));
      return const Right(true);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}

final userControllerProvider = StateNotifierProvider.autoDispose<UserController, AsyncValue<dynamic>>(
      (ref) => UserController(ref: ref),
);