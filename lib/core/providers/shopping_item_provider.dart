import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/grocery_items_dummy_data.dart';
import '../../models/shopping_item.dart';

// final groceryItems = Provider(
//   (ref) => groceryItemsDummyData,
// );

class ShoppingItemNotifier extends StateNotifier<List<ShoppingItem>> {
  ShoppingItemNotifier() : super(groceryItemsDummyData);

  void addItem(ShoppingItem item) {
    state = [...state, item];
  }

  void removeItem(ShoppingItem item) {
    if (state.contains(item)) {
      state.removeWhere((element) => element.id == item.id);
    }
    if (state.isEmpty) {
      clear();
    }
  }

  void updateItem(ShoppingItem item) {
    if (state.contains(item)) {
      state = state
          .map(
            (element) => element.id == item.id ? item : element,
          )
          .toList();
    }
  }

  bool isEmpty() {
    return state.isEmpty;
  }

  void clear() {
    state = [];
  }
}

final shoppingItemProvider =
    StateNotifierProvider<ShoppingItemNotifier, List<ShoppingItem>>(
  (ref) => ShoppingItemNotifier(),
);
