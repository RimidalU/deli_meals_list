import 'package:flutter/material.dart';

import '/features/main_drawer/main_drawer.dart';
import '../widgets/widgets.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawerScreen(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              CustomSwitchListTile(
                title: 'Gluten Free',
                description: 'Only include gluten-free meals.',
                currentValue: glutenFree,
                updateValue: (newValue) {
                  setState(
                    () {
                      glutenFree = newValue;
                    },
                  );
                },
              ),
              CustomSwitchListTile(
                currentValue: vegetarian,
                description: 'Vegetarian',
                title: 'Only include vegetarian meals.',
                updateValue: (newValue) {
                  setState(
                    () {
                      vegetarian = newValue;
                    },
                  );
                },
              ),
              CustomSwitchListTile(
                currentValue: vegan,
                description: 'Vegan',
                title: 'Only include vegan meals.',
                updateValue: (newValue) {
                  setState(
                    () {
                      vegan = newValue;
                    },
                  );
                },
              ),
              CustomSwitchListTile(
                currentValue: lactoseFree,
                description: 'Lactose Free',
                title: 'Only include lactose free meals.',
                updateValue: (newValue) {
                  setState(
                    () {
                      lactoseFree = newValue;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
