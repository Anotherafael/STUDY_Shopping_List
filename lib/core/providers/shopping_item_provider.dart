import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_shopping_list_app/data/categories_dummy_data.dart';
import '../../models/shopping_item.dart';
import 'package:http/http.dart' as http;

class ShoppingItemNotifier extends StateNotifier<List<ShoppingItem>> {
  ShoppingItemNotifier() : super([]);

  final _baseUrl = 'flutter-prep-624f5-default-rtdb.firebaseio.com';
  final _baseJson = 'shopping-list.json';

  Future<List<ShoppingItem>> loadItems() async {
    final url = Uri.https(_baseUrl, _baseJson);
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      throw Exception('Failed to load items');
    }

    if (response.body.isEmpty || response.body == 'null') {
      return [];
    }

    final Map<String, dynamic> data = json.decode(response.body);
    final List<ShoppingItem> items = [];

    for (final item in data.entries) {
      final category = categoriesDummyData.entries
          .firstWhere((element) => element.value.name == item.value['category'])
          .value;
      items.add(
        ShoppingItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    state = items;
    return items;
  }

  Future<void> addItem(ShoppingItem item) async {
    final url = Uri.https(_baseUrl, _baseJson);
    await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'name': item.name,
          'quantity': item.quantity,
          'category': item.category!.name,
        },
      ),
    );
  }

  Future<String> removeItem(ShoppingItem item) async {
    final url = Uri.https(_baseUrl, 'shopping-list/${item.id}.json');

    if (state.contains(item)) {
      final res = await http.delete(url);
      state.removeWhere((element) => element.id == item.id);
      if (res.statusCode >= 400) {
        return 'Something went wrong. Try again later.';
      }
    }

    if (state.isEmpty) {
      clear();
    }

    return '';
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
