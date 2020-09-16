import 'package:f04_popback/edit.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final List<String> list = [];
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _view();
  }

  _view() => Scaffold(
        appBar: AppBar(
          title: Text("List View"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _launch();
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.separated(
            itemCount: widget.list.length,
            separatorBuilder: (_, __) => Divider(
              height: 1.5,
              color: Colors.blue[700],
            ),
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.check),
              ),
              title: Text(widget.list[index]),
            ),
          ),
        ),
      );

  _launch() async {
    final String message = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditView(),
        ));

    if (null != message) {
      setState(() {
        widget.list.add(message);
      });
    }
  }
}
