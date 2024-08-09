import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/core/widgets/app_bar.dart';
import 'package:meal_ai/features/meal_plan_page/screens/meal_plane_page.dart';
import 'package:meal_ai/features/recipes/screens/recipes_page.dart';
import 'package:meal_ai/features/settings_page/screens/settings_page.dart';
import 'package:meal_ai/features/grocery_list_page/screens/grocery_list.dart';

class MainPage extends StatefulWidget {

  static String name = 'Home';

  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final navBarMenus = <NavItem>[
    NavItem(
      icon: Icons.home,
      label: 'Home',
    ),
    NavItem(
      icon: Icons.shopping_cart,
      label: 'Planner',
    ),
    NavItem(
      icon: Icons.calendar_today,
      label: 'Pantry',
    ),
    NavItem(
      icon: Icons.settings,
      label: 'Shop',
    ),
  ];

  final List<Widget> pages = [
    const RecipesPage(),
    const GroceryListPage(),
    const MealPlanPage(),
    const SettingsPage(),
  ];

  bool isOnMainPage = true;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: PopScope(
        canPop: !isOnMainPage,
        child: pages[currentIndex],
      ),
      bottomNavigationBar: isOnMainPage
          ? BrutBottomNavigationBar(
              activeColor: Theme.of(context).colorScheme.secondary,
              defaultColor: Theme.of(context).colorScheme.primary,
              items: navBarMenus,
              currentIndex: currentIndex,
              onItemTapped: onTap,
      )
          : null,
    );
  }
}

