import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_shopping_list_app/core/providers/grocery_item_provider.dart';
import 'package:study_shopping_list_app/modules/home/components/listview_card_item.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.local_grocery_store,
          color: Theme.of(context).colorScheme.onBackground,
          size: 24,
        ),
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
        itemCount: ref.watch(groceryItems).length,
        itemBuilder: (_, index) {
          final groceryItem = ref.watch(groceryItems)[index];
          return ListViewCardItemWidget(
            groceryItem: groceryItem,
          );
        },
      ),
    );
  }
}
