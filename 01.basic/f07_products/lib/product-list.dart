import 'package:f07_products/product-edit.dart';
import 'package:f07_products/product-model.dart';
import 'package:flutter/material.dart';

typedef ProductConsumer(Product p);

class ProductList extends StatefulWidget {
  final model = ProductModel();
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_florist),
        title: Text("Products"),
      ),
      body: ListView.builder(
          itemCount: widget.model.products.length,
          itemBuilder: (_, index) => _item(widget.model.products[index])),
      floatingActionButton: ProductAddBtn(saveListener: _addProduct),
    );
  }

  _addProduct(Product p) {
    setState(() {
      widget.model.add(p);
    });
  }

  _item(Product p) => Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(p.category.title),
            ),
            title: Text(p.name),
            subtitle: Text(p.price.toString()),
          ),
        ),
        margin: EdgeInsets.all(4),
      );
}
