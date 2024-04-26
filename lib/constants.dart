import 'package:flutter/material.dart';

class Products {
  final int id;
  final String name;
  final double price;
  final Color? color;
  Products({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
  });
}

List<Products> products = [
  Products(id: 0, name: "Laptop", price: 10000, color: Colors.amber),
  Products(id: 1, name: "SmartPhone", price: 500, color: Colors.lightBlue),
  Products(id: 2, name: "Samsaung", price: 200, color: Colors.green),
  Products(id: 3, name: "Realme", price: 60, color: Colors.blueGrey),
  Products(id: 4, name: "Mac", price: 780, color: Colors.redAccent),
  Products(id: 5, name: "Apple", price: 4560.80, color: Colors.purple),
  Products(id: 6, name: "Desk", price: 90, color: Colors.lime),
  Products(id: 7, name: "Bat", price: 125, color: Colors.black),
  Products(
      id: 8,
      name: "Pen",
      price: 10000,
      color: const Color.fromARGB(255, 255, 7, 201)),
];
