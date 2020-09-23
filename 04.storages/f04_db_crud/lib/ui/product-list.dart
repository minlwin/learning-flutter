import 'package:f04_db_crud/db/product.dart';
import 'package:f04_db_crud/ui/product-edit.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<List<Product>> _list;
  final ProductRepo _repo = ProductRepo();

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    setState(() {
      _list = _repo.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DB CRUD"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNew,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> list = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text(
                        list[index].category.substring(0, 1).toUpperCase()),
                  ),
                  title: Text(list[index].name),
                  subtitle: Text(list[index].category),
                  trailing: Text(list[index].price.toString()),
                ),
                itemCount: list.length,
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
          future: _list,
        ),
      ),
    );
  }

  _addNew() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductEdit(),
        ));
    _load();
  }
}
