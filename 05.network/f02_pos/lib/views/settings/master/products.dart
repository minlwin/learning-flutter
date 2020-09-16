import 'package:f02_pos/model/api/product-api.dart';
import 'package:f02_pos/model/dto/category.dart';
import 'package:f02_pos/model/dto/product.dart';
import 'package:f02_pos/views/settings/master/product-edit.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  static final String navigationId = "/products";

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Future<List<Product>> _future;

  @override
  Widget build(BuildContext context) {
    Category category = ModalRoute.of(context).settings.arguments;

    setState(() {
      _future = ProductApi().search(category: category.id);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ProductEdit.navigationId,
              arguments: category);
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> list = snapshot.data;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(),
                    child: ListTile(
                      leading: CircleAvatar(
                        child:
                            Text(category.name.substring(0, 1).toUpperCase()),
                      ),
                      title: Text(list[index].name),
                    ),
                  ),
                ),
              );
            }

            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("There is error."),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
