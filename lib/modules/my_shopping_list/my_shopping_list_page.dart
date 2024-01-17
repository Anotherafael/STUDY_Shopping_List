import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_shopping_list_app/core/providers/shopping_item_provider.dart';
import 'package:study_shopping_list_app/modules/my_shopping_list/components/my_shopping_list_card_item.dart';

import '../add_item/add_item_page.dart';

class MyShoppingListPage extends ConsumerStatefulWidget {
  const MyShoppingListPage({super.key});

  @override
  ConsumerState<MyShoppingListPage> createState() => _MyShoppingListPageState();
}

class _MyShoppingListPageState extends ConsumerState<MyShoppingListPage> {
  @override
  void initState() {
    super.initState();
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
        future: ref.read(shoppingItemProvider.notifier).loadItems(),
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
          } else {
            return ref.watch(shoppingItemProvider.notifier).isEmpty()
                ? Center(
                    child: Text(
                      'No items',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontFamily: GoogleFonts.aBeeZee().fontFamily,
                              ),
                    ),
                  )
                : ListView.builder(
                    itemCount: ref.watch(shoppingItemProvider).length,
                    itemBuilder: (context, index) {
                      final shoppingItem =
                          ref.watch(shoppingItemProvider)[index];
                      return MyShoppingListCardItemWidget(
                        shoppingItem: shoppingItem,
                      );
                    },
                  );
          }
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
