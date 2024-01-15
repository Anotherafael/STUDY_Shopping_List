import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  others,
}

class Category {
  String name;
  Color color;

  Category({
    required this.name,
    required this.color,
  });
}
