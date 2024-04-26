import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test_flutter/pages/cart_page.dart';
import 'package:provider_test_flutter/pages/home_page.dart';
import 'package:provider_test_flutter/providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/home_page': (context) => const HomePage(),
        '/cart_page': (context) => const CartPage()
      },
      home: const HomePage(),
    );
  }
}
