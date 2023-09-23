import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String description;

  const Category({
    required this.id,
    required this.title,
    required this.description,
    this.color = Colors.orange,
  });
}
