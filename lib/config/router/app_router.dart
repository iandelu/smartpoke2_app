import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/core/loading_page.dart';
import 'package:meal_ai/features/category/category_screen.dart';
import 'package:meal_ai/features/category/models/category_models.dart';
import 'package:meal_ai/features/category/providers/catgories_provider.dart';
import 'package:meal_ai/features/main_page/screens/main_page.dart';
import 'package:meal_ai/features/product/screens/product_detail_screen.dart';
import 'package:meal_ai/features/recipes/screens/recipe_detail.dart';
import 'package:meal_ai/features/settings_page/screens/settings_account_page.dart';
import 'package:meal_ai/features/user/screens/init_screen.dart';
import 'package:meal_ai/features/user/service/auth_state_user_service.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoadingPage.name,
      builder: (context, state) => const LoadingPage(),
    ),
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
    GoRoute(
      path: '/recipe/:id',
      name: RecipeDetail.name,
      builder: (context, state) {
        final parameter = state.pathParameters['id'] ?? '-1';
        int recipeId = int.parse(parameter);
        return RecipeDetail(id: recipeId);
      },
    ),
    GoRoute(
      path: '/settings/account',
      name: SettingsAccountPage.name,
      builder: (context, state) => const SettingsAccountPage()
    ),
    GoRoute(
      path: '/product/:ean',
      name: ProductDetail.name,
      builder: (context, state) {
        final parameter = state.pathParameters['ean'] ?? '7622210449283';
        String recipeId = parameter;
        return ProductDetail(ean: recipeId);
      },
    ),
    GoRoute(
      path: '/category/:category',
      name: CategoryScreen.name,
      builder: (context, state) {
        final parameter = state.pathParameters['category'] ?? '';
        return CategoryScreen(categoryName: parameter);
      },
    ),
    ],
);
