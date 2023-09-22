import 'package:flutter/material.dart';

import '/features/main_drawer/main_drawer.dart';
import '../filters.dart';
import '../widgets/widgets.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.handleSetFilters,
    required this.handleResetFilters,
    required this.filters,
  });

  final Function handleSetFilters;
  final Function handleResetFilters;
  final Filter filters;

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
  void initState() {
    glutenFree = widget.filters.glutenFree;
    vegetarian = widget.filters.vegetarian;
    vegan = widget.filters.vegan;
    lactoseFree = widget.filters.lactoseFree;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CloseButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
        ],
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
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(10),
                  ),
                  onPressed: () {
                    final selectedFilters = Filter(
                      glutenFree: glutenFree,
                      lactoseFree: lactoseFree,
                      vegan: vegan,
                      vegetarian: vegetarian,
                    );

                    widget.handleSetFilters(selectedFilters);
                    Navigator.of(context).pushNamed('/');
                  },
                  child: const Text('Save Filters'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(10),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.red.shade100)),
                  onPressed: () {
                    final selectedFilters = Filter(
                      glutenFree: glutenFree,
                      lactoseFree: lactoseFree,
                      vegan: vegan,
                      vegetarian: vegetarian,
                    );

                    widget.handleResetFilters();

                    Navigator.of(context).pushNamed('/');
                  },
                  child: const Text('Remove All Filters And Exit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
