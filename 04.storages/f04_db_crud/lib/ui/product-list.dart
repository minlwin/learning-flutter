import 'package:f04_db_crud/db/product.dart';
import 'package:f04_db_crud/ui/product-edit.dart';
import 'package:f04_db_crud/ui/widget.dart';
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
                itemBuilder: (context, index) => _item(list[index]),
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

  _item(Product product) => Dismissible(
        key: UniqueKey(),
        background: _background(Colors.red, Icons.delete, "Delete", true),
        secondaryBackground:
            _background(Colors.green, Icons.edit, "Edit", false),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            // confirm to delete
            return showDialog(
              context: context,
              builder: (context) => ConfirmToDelete(),
            );
          }

          // Navigate to edit view
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductEdit(
                  product: product,
                ),
              ));
          _load();
          return false;
        },
        onDismissed: (direction) async {
          await _repo.delete(product.id);
          _load();
        },
        child: ListTile(
          leading: CircleAvatar(
            child: Text(product.category.substring(0, 1).toUpperCase()),
          ),
          title: Text(product.name),
          subtitle: Text(product.category),
          trailing: Text(product.price.toString()),
        ),
      );

  _background(Color color, IconData iconData, String name, bool left) =>
      Container(
        color: color,
        padding: left ? EdgeInsets.only(left: 16) : EdgeInsets.only(right: 16),
        child: Row(
          mainAxisAlignment:
              left ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: left
              ? [
                  Icon(
                    iconData,
                    color: Colors.white,
                  ),
                  SizedBox(width: 16),
                  Text(
                    name,
                    style: TextStyle(color: Colors.white),
                  )
                ]
              : [
                  Text(
                    name,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    iconData,
                    color: Colors.white,
                  ),
                ],
        ),
      );

  _addNew() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductEdit(),
        ));
    _load();
  }
}
