import 'package:flutter/material.dart';
import 'package:provider_test_flutter/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart_page');
              },
              icon: const Icon(Icons.shopping_cart_sharp))
        ],
      ),
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemBuilder: (context, index) {
          Products product = products[index];
          return ListTile(
            leading: Container(
              color: product.color,
              width: 20,
              height: 20,
            ),
            title: Text(product.name),
            subtitle: Text("price:${product.price}"),
          );
        },
      ),
    );
  }
}
