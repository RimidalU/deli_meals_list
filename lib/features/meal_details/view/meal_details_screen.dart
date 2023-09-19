import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  static const routeName = '/meals-details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String title = routeArgs['title'];

    return Scaffold(
      // backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'MealDetails',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Text(title),
    );
  }
}
