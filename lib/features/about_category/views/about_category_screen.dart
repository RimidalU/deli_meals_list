import 'package:flutter/material.dart';

import '/features/categories/models/category_model.dart';

class AboutCategoryScreen extends StatelessWidget {
  const AboutCategoryScreen({super.key, required this.dummyCategories});

  final List<Category> dummyCategories;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String id = routeArgs['id'];
    final categoryDetails =
        dummyCategories.firstWhere((element) => element.id == id);

    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        categoryDetails.description,
        style: const TextStyle(fontSize: 18),
      ),
    ));
  }
}
