import 'package:flutter/material.dart';

class Product {
  final String name;
  final int price;

  const Product({this.name, this.price});
}

class ProductRepo {
  final repo = [
    Product(name: "Potato Chips", price: 1000),
    Product(name: "Chocolete Stick", price: 1500),
    Product(name: "Strawberry Cake", price: 2000),
    Product(name: "Choco Pie", price: 1300),
    Product(name: "Fish Chips", price: 900),
    Product(name: "Penuts Seats", price: 1500),
    Product(name: "Alamond Nuts", price: 3000),
    Product(name: "Mix Nuts", price: 3500),
    Product(name: "Blue Cheese", price: 5000),
  ];
}

class ShoppingCart extends ChangeNotifier {
  final Map<Product, int> cart = {};

  addToCart(Product product) {
    if (cart.containsKey(product)) {
      cart[product] += 1;
    } else {
      cart[product] = 1;
    }
    notifyListeners();
  }

  clear() {
    cart.clear();
    notifyListeners();
  }

  List<MapEntry<Product, int>> get list => cart.entries.toList();

  int get total {
    int result = 0;
    cart.forEach((key, value) {
      result += (key.price * value);
    });
    return result;
  }

  int get count => cart.values.fold(0, (a, b) => a + b);
}
