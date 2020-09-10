import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateful Demo"),
        ),
        body: Counter(),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_display(), _button()],
      ),
    );
  }

  _increment() {
    setState(() {
      ++_count;
    });
  }

  _decrement() {
    setState(() {
      --_count;
    });
  }

  Widget _display() => Container(
        child: Text(
          "Count : $_count",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        width: double.infinity,
        height: 200,
        alignment: Alignment.center,
        color: Colors.teal[100],
      );

  Widget _button() => Row(
        children: [
          Expanded(
            child: Padding(
              child: RaisedButton(
                onPressed: _increment,
                child: Text("Count Up"),
                elevation: 4,
              ),
              padding: EdgeInsets.only(left: 5, right: 10),
            ),
          ),
          Expanded(
            child: Padding(
              child: RaisedButton(
                onPressed: _decrement,
                child: Text("Count Down"),
                elevation: 4,
              ),
              padding: EdgeInsets.only(right: 5),
            ),
          )
        ],
      );
}
