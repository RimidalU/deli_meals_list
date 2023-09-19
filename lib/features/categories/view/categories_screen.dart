import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../data/data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  static const routeName = '/';

  List<Widget> _getCategories() {
    return dummyCategories
        .map((e) => CategoryItem(
              id: e.id,
              title: e.title,
              color: e.color,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deli Meals',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [..._getCategories()],
      ),
    );
  }
}
