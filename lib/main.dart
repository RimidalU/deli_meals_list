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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filter filters = const Filter(
    glutenFree: false,
    lactoseFree: false,
    vegan: false,
    vegetarian: false,
  );

  void handleSetFilters(Filter filterData) {
    setState(
      () {
        filters = filterData;
      },
    );
  }

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
        FiltersScreen.routeName: (context) => FiltersScreen(
              filters: filters,
              handleSetFilters: handleSetFilters,
            ),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const CategoriesScreen(),
      ),
    );
  }
}
