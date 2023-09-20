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
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              mealDetails.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
                // color: Colors.amber,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
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
                itemCount: mealDetails.ingredients.length),
          )
        ],
      ),
    );
  }
}
