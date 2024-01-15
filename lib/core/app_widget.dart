import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_shopping_list_app/modules/my_shopping_list/my_shopping_list_page.dart';
import 'package:study_shopping_list_app/shared/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyShoppingListPage(),
        theme: AppTheme.defaultTheme,
      ),
    );
  }
}
