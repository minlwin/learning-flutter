import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final List<String> _items =
      List<String>.generate(20, (index) => "Item ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe Demo"),
        actions: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "${_items.length}",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(4),
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) => Dismissible(
            key: Key(_items[index]),
            child: ListTile(
              title: Text(_items[index]),
            ),
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            direction: DismissDirection.startToEnd,
            confirmDismiss: (direction) async {
              return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Confirm"),
                  content: Text("Do you want to delete this item?"),
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text("Yes I do!")),
                    FlatButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text("No I don't!"),
                    )
                  ],
                ),
              );
            },
            onDismissed: (direction) {
              setState(() {
                _items.removeAt(index);
              });
            },
          ),
        ),
      ),
    );
  }
}
