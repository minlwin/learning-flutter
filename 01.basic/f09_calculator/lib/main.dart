import 'package:f09_calculator/calculator.dart';
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
          leading: Icon(Icons.dialpad),
          title: Text("Calculator"),
        ),
        body: Calculator(),
      ),
    );
  }
}
