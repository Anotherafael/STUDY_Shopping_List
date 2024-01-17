// import 'package:uuid/uuid.dart';

import 'category.dart';

class ShoppingItem {
  String? id;
  String? name;
  int? quantity;
  Category? category;

  ShoppingItem({
    this.id,
    this.name,
    this.quantity,
    this.category,
  });
}
