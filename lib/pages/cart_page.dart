import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test_flutter/constants.dart';
import 'package:provider_test_flutter/providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "In Your Shopping Cart",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Consumer<CartProvider>(builder: (context, cartProvider, _) {
            return Expanded(
              child: ListView.builder(
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  final Products item = cartProvider.items[index];
                  return ListTile(
                    leading: Container(
                      color: item.color,
                      width: 20,
                      height: 20,
                    ),
                    title: Text(item.name),
                    subtitle: Text("Price: ${item.price}"),
                    trailing: IconButton(
                      onPressed: () {
                        cartProvider.removeItem(item);
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          Text(
            "Total amount \$: ${cartProvider.getTotalPrice()}",
          ),
          TextButton(
            onPressed: () {
              cartProvider.deleteAllItem(cartProvider.items);
            },
            child: const Text(
              "Delete All",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
