import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/features/main_page/screens/main_page.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';
void main() async {
  Hive.deleteFromDisk();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NutrientsImplAdapter());
  Hive.deleteFromDisk();
  await Hive.openBox('grocery_list');
  await Hive.openBox('recipe_from_url');
  await Hive.openBox('meal_plan_recipe');
  await Hive.openBox('authBox');
  await Hive.openBox('products');

  /*await Hive.deleteBoxFromDisk('recipe_from_url');
  await Hive.deleteBoxFromDisk('meal_plan_recipe');
  await Hive.deleteBoxFromDisk('grocery_list');
  await Hive.deleteBoxFromDisk('authBox');
  await Hive.deleteBoxFromDisk('products');*/
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Savor',
      theme: AppTheme.getTheme(),
    );
  }
}
