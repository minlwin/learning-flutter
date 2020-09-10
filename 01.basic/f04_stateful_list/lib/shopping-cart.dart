import 'package:f04_stateful_list/products.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  final List<Product> products = ProductFactory.items();

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  Set<Product> _cart = {};

  @override
  Widget build(BuildContext context) {
    return ProductList(
      list: widget.products,
      listener: _changeState,
    );
  }

  _changeState(Product product) {
    setState(() {
      if (_cart.contains(product)) {
        _cart.remove(product);
        product.inCart = false;
      } else {
        product.inCart = true;
        _cart.add(product);
      }
    });
  }
}
