import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'package:fooderlich/home.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

void main() {
  // 1
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // 2
  const Fooderlich({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    // 3
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager())
        ],
        child: const Home(),
      ),
    );
  }
}
