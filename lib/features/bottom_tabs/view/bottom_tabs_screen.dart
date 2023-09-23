import 'package:flutter/material.dart';

import '../../../features/about_category/views/views.dart';
import '../../../features/categories/categories.dart';
import '../../../features/meals/models/models.dart';
import '../../../features/meals/view/view.dart';

class BottomTabsScreen extends StatefulWidget {
  const BottomTabsScreen({
    super.key,
    required this.availableMeal,
    required this.dummyCategories,
  });

  final List<Meal> availableMeal;
  final List<Category> dummyCategories;

  @override
  State<BottomTabsScreen> createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  int selectedPage = 0;

  late List<Map<String, Object>> tabs;

  @override
  void initState() {
    tabs = [
      {
        'title': 'To Meals List',
        'icon': Icons.ramen_dining_outlined,
        'view': MealsScreen(availableMeal: widget.availableMeal)
      },
      {
        'title': 'About',
        'icon': Icons.info,
        'view': AboutCategoryScreen(dummyCategories: widget.dummyCategories),
      },
    ];

    super.initState();
  }

  List<BottomNavigationBarItem> getNavigationTabs() {
    return tabs
        .map(
          (tab) => BottomNavigationBarItem(
            icon: Icon(tab['icon'] as IconData),
            label: tab['title'] as String,
          ),
        )
        .toList();
  }

  void handleChangePage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgs['title'] as String,
          style: const TextStyle(
            fontSize: 28,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: tabs[selectedPage]['view'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: handleChangePage,
        backgroundColor: Colors.grey.shade300,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedPage,
        items: [...getNavigationTabs()],
        // type: BottomNavigationBarType.shifting,  // change animation
      ),
    );
  }
}
