import 'package:study_shopping_list_app/data/categories_dummy_data.dart';

import '../models/category.dart';
import '../models/grocery_item.dart';

List<GroceryItem> groceryItemsDummyData = [
  GroceryItem(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categoriesDummyData[Categories.dairy],
  ),
  GroceryItem(
    id: 'b',
    name: 'Bananas',
    quantity: 5,
    category: categoriesDummyData[Categories.fruit]!,
  ),
  GroceryItem(
    id: 'c',
    name: 'Beef Steak',
    quantity: 1,
    category: categoriesDummyData[Categories.meat]!,
  ),
];
