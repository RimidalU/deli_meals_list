import 'package:flutter/material.dart';

import '/features/filters/filters.dart';
import '../widgets/widgets.dart';

class MainDrawerScreen extends StatelessWidget {
  const MainDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).secondaryHeaderColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MenuItem(
            title: 'Meals',
            icon: Icons.restaurant,
            handleTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          MenuItem(
            title: 'Filters',
            icon: Icons.settings,
            handleTap: () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
