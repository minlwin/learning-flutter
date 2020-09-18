import 'package:f02_pos/model/api/product-api.dart';
import 'package:f02_pos/model/dto/product.dart';
import 'package:f02_pos/template/widgets.dart';
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

  _loadData() {
    setState(() {
      _future = ProductApi().search(
        category: CategoryHolder.of(context).data.id,
      );
    });
  }

  _addNew() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryHolder(
              data: CategoryHolder.of(this.context).data, child: ProductEdit()),
        ));
    _loadData();
  }

  _editProduct(Product p) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductHolder(
            data: p,
            child: ProductEdit(),
          ),
        ));
    _loadData();
  }

  _editCategory() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryHolder(
            data: CategoryHolder.of(this.context).data,
            child: CategoryEdit(),
          ),
        ));
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryHolder.of(context).data.name),
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
            child: GestureDetector(
              onTap: () {
                _editProduct(list[index]);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green[100],
                  foregroundColor: Colors.red[900],
                  child: Text(
                    CategoryHolder.of(context)
                        .data
                        .name
                        .substring(0, 1)
                        .toUpperCase(),
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
        ),
      );
}
