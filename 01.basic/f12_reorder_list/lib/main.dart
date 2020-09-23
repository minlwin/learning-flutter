import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reorder List"),
        ),
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final List<String> _items =
      List<String>.generate(10, (index) => "Item ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ReorderableListView(
        children: _items
            .map((e) => Card(
                  key: Key(e),
                  child: ListTile(
                    leading: Icon(Icons.drag_handle),
                    title: Text(e),
                  ),
                ))
            .toList(),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }

            var item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
