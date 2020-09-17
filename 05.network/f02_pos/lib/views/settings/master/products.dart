import 'package:f02_pos/model/api/product-api.dart';
import 'package:f02_pos/model/dto/category.dart';
import 'package:f02_pos/model/dto/product.dart';
import 'package:f02_pos/views/settings/master/category-edit.dart';
import 'package:f02_pos/views/settings/master/product-edit.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  static final String navigationId = "/products";

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Future<List<Product>> _future;
  Category _category;

  _loadData() {
    setState(() {
      _future = ProductApi().search(category: _category.id);
    });
  }

  _addNew() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductEdit(
            category: _category,
          ),
        ));
    _loadData();
  }

  _editCategory() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryEdit(),
            settings: RouteSettings(arguments: _category)));
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    _category = ModalRoute.of(context).settings.arguments;
    _loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text(_category.name),
        actions: [
          GestureDetector(
            onTap: _editCategory,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.edit),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNew,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> list = snapshot.data;
              return _list(list);
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

  _list(List<Product> list) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Card(
          child: Padding(
            padding: EdgeInsets.symmetric(),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[100],
                foregroundColor: Colors.red[900],
                child: Text(
                  _category.name.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(list[index].name),
              subtitle: Text(list[index].price.toString()),
            ),
          ),
        ),
      );
}
