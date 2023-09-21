import 'package:flutter/material.dart';

class MainDrawerScreen extends StatelessWidget {
  const MainDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Center(
        child: Text('MainDrawerScreen'),
      ),
    );
  }
}
