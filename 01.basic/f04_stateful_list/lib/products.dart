import 'package:flutter/material.dart';

class Product {
  String name;
  bool inCart;
  Product({this.name, this.inCart});
}

typedef ProductActionListener(Product product);

class ProductList extends StatelessWidget {
  final ProductActionListener listener;
  final List<Product> list;

  const ProductList({Key key, this.listener, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text(list[i].name.substring(0, 1).toUpperCase()),
          ),
          title: Text(list[i].name),
          trailing: Icon(list[i].inCart
              ? Icons.remove_shopping_cart
              : Icons.add_shopping_cart),
          onTap: () {
            listener(list[i]);
          },
        ),
      ),
      itemCount: list.length,
    );
  }
}

class ProductFactory {
  static List<Product> items() => [
        Product(name: "Face Mask", inCart: false),
        Product(name: "Face Shield", inCart: false),
        Product(name: "Hand Gel", inCart: false),
        Product(name: "Carbollic Soap", inCart: false),
        Product(name: "Potato Chips", inCart: false),
        Product(name: "Chocolate", inCart: false),
        Product(name: "Gel Candy", inCart: false),
        Product(name: "No Sugar Coffee", inCart: false),
      ];
}
