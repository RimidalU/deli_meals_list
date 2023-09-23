import 'package:deli_meals_list/features/meals/models/models.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    required this.favoriteMeals,
  });

  static const routeName = 'favorites/';

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'You have no favorites yet - start adding some!${favoriteMeals.length}'),
    );
  }
}
