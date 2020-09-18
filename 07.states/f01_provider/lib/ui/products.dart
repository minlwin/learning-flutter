import 'package:f01_provider/model/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductRepo products = Provider.of<ProductRepo>(
      context,
      listen: false,
    );

    ShoppingCart cart = Provider.of<ShoppingCart>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Using Provider"),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(Icons.shopping_cart),
                  ),
                  Consumer<ShoppingCart>(
                    builder: (context, value, child) => Text("${value.count}"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.repo.length,
          itemBuilder: (context, index) => Card(
            child: GestureDetector(
              onTap: () {
                cart.addToCart(products.repo[index]);
              },
              child: ListTile(
                title: Text(products.repo[index].name),
                subtitle: Text(products.repo[index].price.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
