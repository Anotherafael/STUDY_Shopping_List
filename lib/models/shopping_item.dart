import 'package:uuid/uuid.dart';

import 'category.dart';

class ShoppingItem {
  String id = const Uuid().v4();
  String? name;
  int? quantity;
  Category? category;

  ShoppingItem({
    this.name,
    this.quantity,
    this.category,
  });
}
