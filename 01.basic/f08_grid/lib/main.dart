import 'package:f08_grid/grid.dart';
import 'package:f08_grid/list.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final list = [
    "Flutter",
    "Dart",
    "Android",
    "iOS",
    "Desktop",
    "Web",
    "Ecomas",
    "Gallary",
    "Dev First",
    "Beautiful"
  ];

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ViewState state = ViewState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _body(),
        ),
      ),
    );
  }

  _appBar() => AppBar(
        leading: state.leading,
        title: Text(state.title),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                state.switchState();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: state.action,
            ),
          )
        ],
      );

  _body() =>
      state.grid ? GridBody(list: widget.list) : ListsBody(list: widget.list);
}

class ViewState {
  bool grid = true;
  get title => grid ? "Grid View" : "List View";
  get leading => Icon(grid ? Icons.grid_on : Icons.list);
  get action => Icon(grid ? Icons.list : Icons.grid_on);
  switchState() {
    grid = !grid;
  }
}
