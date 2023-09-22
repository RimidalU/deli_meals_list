import 'package:flutter/material.dart';

import '../../../features/about_category/views/views.dart';
import '../../../features/meals/view/view.dart';

class BottomTabsScreen extends StatefulWidget {
  const BottomTabsScreen({super.key});

  @override
  State<BottomTabsScreen> createState() => _BottomTabsScreenState();
}

final List<Map<String, Object>> tabs = [
  {
    'title': 'To Meals List',
    'icon': Icons.ramen_dining_outlined,
    'view': const MealsScreen()
  },
  {
    'title': 'About',
    'icon': Icons.info,
    'view': const AboutCategoryScreen(),
  },
];

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

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  int selectedPage = 0;

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
