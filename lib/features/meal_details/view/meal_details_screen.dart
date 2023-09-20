import 'package:deli_meals_list/features/meal_details/widgets/list_container.dart';
import 'package:deli_meals_list/features/meal_details/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '/features/meals/data/dummy_meals.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  static const routeName = '/meals-details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String id = routeArgs['id'];
    final mealDetails = dummyMeals.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealDetails.title,
          style: const TextStyle(
            fontSize: 22,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          softWrap: true,
          overflow: TextOverflow.fade,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                mealDetails.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SectionTitle(title: 'Ingredients:'),
            ListContainer(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        mealDetails.ingredients[index],
                      ),
                    ),
                  );
                },
                itemCount: mealDetails.ingredients.length,
              ),
            ),
            const SectionTitle(title: 'Steps to Cooking:'),
            ListContainer(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(mealDetails.steps[index]),
                      ),
                      const Divider()
                    ],
                  );
                },
                itemCount: mealDetails.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
