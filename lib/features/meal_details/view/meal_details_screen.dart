import 'package:flutter/material.dart';

import '../../../features/meals/models/models.dart';
import '../widgets/widgets.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.availableMeal,
    required this.handleToggleFavorites,
  });

  final List<Meal> availableMeal;
  final Function handleToggleFavorites;
  static const routeName = '/meals-details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String id = routeArgs['id'];
    final mealDetails = availableMeal.firstWhere((element) => element.id == id);
    final mediaQuery = MediaQuery.of(context);

    final appBar = AppBar(
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
    );

    final bodyHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: bodyHeight * 0.25,
              width: double.infinity,
              child: Image.network(
                mealDetails.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SectionTitle(title: 'Ingredients:'),
            ListContainer(
              mediaQuery: mediaQuery,
              bodyHeight: bodyHeight,
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
              mediaQuery: mediaQuery,
              bodyHeight: bodyHeight,
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
      floatingActionButton: FloatingActionButton(
          onPressed: () => handleToggleFavorites(id),
          child: const Icon(Icons.favorite)),
    );
  }
}
