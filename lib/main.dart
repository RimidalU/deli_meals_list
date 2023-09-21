import 'package:flutter/material.dart';

import 'features/bottom_tabs/view/bottom_tabs_screen.dart';
import 'features/categories/categories.dart';
import 'features/favorites/favorites.dart';
import 'features/filters/filters.dart';
import 'features/meal_details/meal_details.dart';
import 'features/meals/meals.dart';
import 'features/tabs/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white10,
          ),
          scaffoldBackgroundColor: Colors.grey.shade200,
          useMaterial3: true,
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
            labelMedium: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
          )),
      // initialRoute: CategoriesScreen.routeName,
      routes: {
        '/': (context) => const TabsScreen(),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        MealsScreen.routeName: (context) => const BottomTabsScreen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
        FavoritesScreen.routeName: (context) => const FavoritesScreen(),
        FiltersScreen.routeName: (context) => const FiltersScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const CategoriesScreen(),
      ),
    );
  }
}
