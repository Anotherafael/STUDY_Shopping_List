import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_shopping_list_app/models/shopping_item.dart';

import '../../../core/providers/shopping_item_provider.dart';

class MyShoppingListCardItemWidget extends ConsumerWidget {
  const MyShoppingListCardItemWidget({
    super.key,
    required this.shoppingItem,
  });

  final ShoppingItem shoppingItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(shoppingItem.id!),
      onDismissed: (_) async {
        final msg = await ref
            .read(shoppingItemProvider.notifier)
            .removeItem(shoppingItem);
        // ignore: unrelated_type_equality_checks
        if (msg != '') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msg),
            ),
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 24),
              child: Container(
                height: 32,
                width: 32,
                color: shoppingItem.category!.color,
                child: Center(
                  child: Text(
                    shoppingItem.category!.name[0],
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.varelaRound().fontFamily,
                          fontSize: 20,
                        ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                shoppingItem.name!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${shoppingItem.quantity}',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: 4),
                  // const Icon(
                  //   Icons.store_mall_directory_outlined,
                  //   size: 32,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
