import 'package:flutter/material.dart';
import '../constants.dart';

class CartProvider extends ChangeNotifier {
  final List<Products> _items = [];

  List<Products> get items => _items;

  void nl() {
    notifyListeners();
  }

  void addItem(Products item) {
    _items.add(item);
    nl();
  }

  void removeItem(Products item) {
    _items.remove(item);
    nl();
  }

  void deleteAllItem(List<Products> items) {
    items.clear();
    nl();
  }

  double getTotalPrice() {
    return items.fold(
        0, (previousValue, element) => previousValue += element.price);
  }
}
