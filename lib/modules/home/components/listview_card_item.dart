import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_shopping_list_app/models/grocery_item.dart';

class ListViewCardItemWidget extends ConsumerWidget {
  const ListViewCardItemWidget({
    super.key,
    required this.groceryItem,
  });

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
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
              color: groceryItem.category!.color,
            ),
          ),
          Expanded(
            child: Text(
              groceryItem.name,
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
                  '${groceryItem.quantity}',
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
    );
  }
}
