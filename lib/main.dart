import 'package:flutter/material.dart';

import 'features/categories/categories.dart';
import 'features/meal_details/view/meal_details_screen.dart';
import 'features/meals/meals.dart';

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
      ),
      initialRoute: CategoriesScreen.routeName,
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        MealsScreen.routeName: (context) => const MealsScreen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen()
      },
    );
  }
}
