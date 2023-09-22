import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.availableMeal});

  final List<Meal> availableMeal;

  static const routeName = '/meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String id = routeArgs['id'];
    final Color color = routeArgs['color'];
    final categoryMeals = availableMeal
        .where((element) => element.categories.contains(id))
        .toList();

    return Container(
      color: color.withAlpha(60),
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            id: categoryMeals[index].id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
