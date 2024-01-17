import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_shopping_list_app/core/providers/shopping_item_provider.dart';
import 'package:study_shopping_list_app/modules/my_shopping_list/components/my_shopping_list_card_item.dart';

import '../../models/shopping_item.dart';
import '../add_item/add_item_page.dart';

class MyShoppingListPage extends ConsumerStatefulWidget {
  const MyShoppingListPage({super.key});

  @override
  ConsumerState<MyShoppingListPage> createState() => _MyShoppingListPageState();
}

class _MyShoppingListPageState extends ConsumerState<MyShoppingListPage> {
  late Future<List<ShoppingItem>> _loadedItems;

  @override
  void initState() {
    super.initState();
    _loadedItems = ref.read(shoppingItemProvider.notifier).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
            child: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.background,
              size: 24,
            ),
          ),
        ),
        title: const Text("My Shopping List"),
      ),
      body: FutureBuilder(
        future: _loadedItems,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went wrong',
              ),
            );
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No items'),
            );
          }

          return ListView.builder(
            itemCount: ref.watch(shoppingItemProvider).length,
            itemBuilder: (context, index) {
              final shoppingItem = ref.watch(shoppingItemProvider)[index];
              return MyShoppingListCardItemWidget(
                shoppingItem: shoppingItem,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const AddItemPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
