import 'package:flutter/material.dart';

class CustomSwitchListTile extends StatelessWidget {
  const CustomSwitchListTile({
    super.key,
    required this.title,
    required this.description,
    required this.currentValue,
    required this.updateValue,
  });

  final String title;
  final String description;
  final bool currentValue;
  final Function updateValue;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: (value) => updateValue(value),
    );
  }
}
