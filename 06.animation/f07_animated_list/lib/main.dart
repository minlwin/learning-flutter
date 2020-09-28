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
          title: Text("Animated List"),
        ),
        body: MyList(),
      ),
    );
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final GlobalKey<AnimatedListState> _listState = GlobalKey();

  int _counter = 2;
  List<String> _list = ["Item 1", "Item 2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Insert
          setState(() {
            _counter++;
            _listState.currentState.insertItem(
              0,
              duration: Duration(milliseconds: 800),
            );
            _list = []
              ..add("Item $_counter")
              ..addAll(_list);
          });
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedList(
          key: _listState,
          itemBuilder: (_, index, animation) =>
              _slideTransition(index, animation),
          initialItemCount: _list.length,
        ),
      ),
    );
  }

  _listItem(int index) => Card(
        color: Colors.blue[100],
        child: ListTile(
          title: Text(
            _list[index],
            style: Theme.of(context).textTheme.headline5,
          ),
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                // remove Item
                _listState.currentState.removeItem(
                  index,
                  (context, animation) => _slideTransition(index, animation),
                  duration: Duration(seconds: 1),
                );
                _list.removeAt(index);
              });
            },
            child: Icon(Icons.delete_forever),
          ),
        ),
      );

  _slideTransition(int index, Animation<double> animation) => SlideTransition(
        position: animation.drive(
          Tween(
            begin: Offset(1, 0),
            end: Offset(0, 0),
          ),
        ),
        child: _listItem(index),
      );
}
