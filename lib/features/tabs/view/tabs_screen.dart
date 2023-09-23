import 'package:flutter/material.dart';

import '/features/categories/categories.dart';
import '/features/categories/models/models.dart';
import '/features/favorites/favorites.dart';
import '/features/main_drawer/main_drawer.dart';
import '/features/meals/models/models.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({
    super.key,
    required this.favoriteMeals,
    required this.dummyCategories,
  });

  final List<Meal> favoriteMeals;
  final List<Category> dummyCategories;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'DeliMeals',
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(tabs: [...getTabs()]),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(dummyCategories: dummyCategories),
            FavoritesScreen(favoriteMeals: favoriteMeals),
          ],
        ),
        drawer: const MainDrawerScreen(),
      ),
    );
  }
}

const tabs = [
  {
    'title': 'Categories',
    'icon': Icons.category_outlined,
    'viewWidget': CategoriesScreen
  },
  {
    'title': 'Favorites',
    'icon': Icons.favorite_outline,
    'viewWidget': FavoritesScreen
  },
];

List<Widget> getTabs() {
  return tabs
      .map((tab) => Tab(
            icon: Icon(tab['icon'] as IconData),
            text: tab['title'] as String,
          ))
      .toList();
}
