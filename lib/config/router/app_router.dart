import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/features/main_page/screens/main_page.dart';
import 'package:meal_ai/features/user/screens/init_screen.dart';
import 'package:meal_ai/features/user/service/auth_state_user_service.dart';

final appRouter = Provider<GoRouter>((ref) {
  final user = ref.watch(authStateProvider.notifier).state?.user;

  return GoRouter(
    initialLocation: user != null ? '/home' : '/session',
    routes: [
      GoRoute(
        path: '/home',
        name: MainPage.name,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: '/session',
        name: InitialPage.name,
        builder: (context, state) => const InitialPage(),
      ),
    ],
  );
});