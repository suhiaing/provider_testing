import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_test_flutter/constants.dart';
import 'package:provider_test_flutter/providers/cart_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart_page');
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, _) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
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
                      trailing: Checkbox(
                        value: cartProvider.items.contains(product),
                        onChanged: (value) {
                          if (value == true) {
                            cartProvider.addItem(product);
                          } else {
                            cartProvider.removeItem(product);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  cartProvider.deleteAllItem(cartProvider.items);
                },
                child: const Text(
                  "Clear All",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
