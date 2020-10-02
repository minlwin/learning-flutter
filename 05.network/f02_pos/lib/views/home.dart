import 'package:f02_pos/template/side-bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static final String navigationId = "/";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _search
            ? TextField(
                onSubmitted: (value) {
                  // search
                },
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )
            : Text("Mini Pos"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _search = !_search;
              });
            },
          )
        ],
      ),
      drawer: Drawer(child: SideBar()),
      body: Container(),
    );
  }
}
