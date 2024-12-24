import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:challenge5/config/theme.dart';
import 'package:challenge5/screens/home_screen.dart';
import 'package:challenge5/providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FOODIGO',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
