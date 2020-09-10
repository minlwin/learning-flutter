import 'package:f04_stateful_list/shopping-cart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("StateFul List"),
        ),
        body: ShoppingCart(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
