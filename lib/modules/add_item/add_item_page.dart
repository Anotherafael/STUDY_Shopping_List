import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_shopping_list_app/core/providers/category_provider.dart';
import 'package:study_shopping_list_app/modules/add_item/components/add_item_text_form_field.dart';

import '../../core/providers/shopping_item_provider.dart';
import '../../models/shopping_item.dart';
import '../my_shopping_list/my_shopping_list_page.dart';

class AddItemPage extends ConsumerStatefulWidget {
  const AddItemPage({super.key});

  @override
  ConsumerState<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends ConsumerState<AddItemPage> {
  final _formKey = GlobalKey<FormState>();
  final _shoppingItem = ShoppingItem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AddItemTextFormFieldWidget(
                label: 'Name',
                hintText: 'Enter item name',
                maxLength: 50,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 3 ||
                      value.length > 50) {
                    return 'Must have between 3 and 50 characters';
                  }
                  return null;
                },
                onSaved: (value) => _shoppingItem.name = value!,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AddItemTextFormFieldWidget(
                      label: 'Quantity',
                      initialValue: '1',
                      hintText: 'Enter item quantity',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be a valid and positive number';
                        }
                        return null;
                      },
                      onSaved: (value) =>
                          _shoppingItem.quantity = int.tryParse(value!),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField(
                      borderRadius: BorderRadius.circular(4.0),
                      hint: const Text('Select category'),
                      items: ref
                          .watch(categories)
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Row(
                                children: [
                                  Container(
                                    height: 16,
                                    width: 16,
                                    color: category.color,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(category.name),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                      onSaved: (value) => _shoppingItem.category = value!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _formKey.currentState!.reset(),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ref.read(shoppingItemProvider.notifier).addItem(
                              _shoppingItem,
                            );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return const MyShoppingListPage();
                            },
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Add Item',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
