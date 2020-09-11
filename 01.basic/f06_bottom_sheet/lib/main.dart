import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Bottom Sheet"),
          ),
          body: Container(
            alignment: Alignment.center,
            child: Text(
              "Hello Bottom Sheet",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 45),
            ),
          ),
          floatingActionButton: ShowBottomSheet(),
        ));
  }
}

class ShowBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(context: context, builder: (ctx) => BottomSheet());
      },
      child: Icon(Icons.send),
    );
  }
}

class BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "Bottom Sheet",
            style: TextStyle(fontSize: 36),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Close Dialog"),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      height: 300,
    );
  }
}
