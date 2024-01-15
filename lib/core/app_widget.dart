import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_shopping_list_app/modules/home/home.dart';
import 'package:study_shopping_list_app/shared/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: const HomePage(),
        theme: AppTheme.defaultTheme,
      ),
    );
  }
}
