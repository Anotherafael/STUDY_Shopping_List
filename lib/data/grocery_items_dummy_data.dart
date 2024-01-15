import 'package:study_shopping_list_app/data/categories_dummy_data.dart';

import '../models/category.dart';
import '../models/shopping_item.dart';

List<ShoppingItem> groceryItemsDummyData = [
  ShoppingItem(
    name: 'Milk',
    quantity: 1,
    category: categoriesDummyData[Categories.dairy],
  ),
  ShoppingItem(
    name: 'Bananas',
    quantity: 5,
    category: categoriesDummyData[Categories.fruit]!,
  ),
  ShoppingItem(
    name: 'Beef Steak',
    quantity: 1,
    category: categoriesDummyData[Categories.meat]!,
  ),
];
