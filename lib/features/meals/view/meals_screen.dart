import 'package:flutter/material.dart';

import '../data/data.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
  });
  static const routeName = '/meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String id = routeArgs['id'];
    final String title = routeArgs['title'];
    final Color color = routeArgs['color'];
    final categoryMeals =
        dummyMeals.where((element) => element.categories.contains(id)).toList();

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
