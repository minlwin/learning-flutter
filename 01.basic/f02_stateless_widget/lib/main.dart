import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateless Widget"),
        ),
        body: MyBody(
          name: "Hello Stateless Widget",
        ),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  final String name;

  const MyBody({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 3))
            ]));
  }
}
