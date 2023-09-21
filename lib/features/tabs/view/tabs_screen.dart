import 'package:flutter/material.dart';

import '/features/categories/categories.dart';
import '/features/favorites/favorites.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

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
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
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
