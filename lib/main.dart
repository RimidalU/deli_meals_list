import 'package:flutter/material.dart';

import '/data/data.dart';
import 'features/bottom_tabs/view/bottom_tabs_screen.dart';
import 'features/categories/categories.dart';
import 'features/filters/filters.dart';
import 'features/meal_details/meal_details.dart';
import 'features/meals/meals.dart';
import 'features/meals/models/models.dart';
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

  List<Meal> availableMeal = dummyMeals;
  List<Meal> favoriteMeals = [];

  void handleSetFilters(Filter filterData) {
    setState(
      () {
        filters = filterData;

        availableMeal = dummyMeals.where((meal) {
          if (filters.glutenFree && !meal.isGlutenFree) {
            return false;
          }
          if (filters.lactoseFree && !meal.isLactoseFree) {
            return false;
          }
          if (filters.vegan && !meal.isVegan) {
            return false;
          }
          if (filters.vegetarian && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
      },
    );
  }

  void handleResetFilters() {
    handleSetFilters(const Filter(
      glutenFree: false,
      lactoseFree: false,
      vegan: false,
      vegetarian: false,
    ));
  }

  void handleToggleFavorites(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
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
        '/': (context) => TabsScreen(favoriteMeals: favoriteMeals),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        MealsScreen.routeName: (context) =>
            BottomTabsScreen(availableMeal: availableMeal),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(
              availableMeal: availableMeal,
              handleToggleFavorites: handleToggleFavorites,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              filters: filters,
              handleSetFilters: handleSetFilters,
              handleResetFilters: handleResetFilters,
            ),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const CategoriesScreen(),
      ),
    );
  }
}
