import 'package:go_router/go_router.dart';
import 'package:meal_ai/features/main_page/screens/main_page.dart';
import 'package:meal_ai/features/user/screens/init_screen.dart';

final appRouter = GoRouter(
    initialLocation: '/session',
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

    ]);
