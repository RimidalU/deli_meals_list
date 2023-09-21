import 'package:flutter/material.dart';

import '/features/main_drawer/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawerScreen(),
      body: const Center(
        child: Text('Filters Screen'),
      ),
    );
  }
}
