import 'package:flutter/material.dart';

class MainDrawerScreen extends StatelessWidget {
  const MainDrawerScreen({super.key});

  Widget buildListTitle({required title, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
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
            buildListTitle(
              title: 'Meals',
              icon: Icons.restaurant,
            ),
            buildListTitle(
              title: 'Filters',
              icon: Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}
