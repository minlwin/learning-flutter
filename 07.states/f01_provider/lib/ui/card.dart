import 'package:f01_provider/model/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShoppingCart shop = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("My Cart"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Chip(
              avatar: Icon(Icons.shopping_cart),
              label: Text("${shop.total}"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          shop.clear();
          Navigator.pop(context);
        },
        child: Icon(Icons.delete),
      ),
      body: ListView.builder(
        itemCount: shop.cart.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(shop.list[index].key.name),
            subtitle: Text(
                "${shop.list[index].key.price} × ${shop.list[index].value}"),
            trailing:
                Text("${shop.list[index].key.price * shop.list[index].value}"),
          ),
        ),
      ),
    );
  }
}
