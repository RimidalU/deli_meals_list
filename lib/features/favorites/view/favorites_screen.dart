import 'package:flutter/material.dart';

import '/features/meals/models/models.dart';
import '/features/meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    required this.favoriteMeals,
  });

  static const routeName = 'favorites/';

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
            'You have no favorites yet - start adding some!${favoriteMeals.length}'),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
              imageUrl: favoriteMeals[index].imageUrl,
              title: favoriteMeals[index].title,
              id: favoriteMeals[index].id,
            );
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}
