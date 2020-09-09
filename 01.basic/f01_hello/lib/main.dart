import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: Container(
        child: Text(
          "Hello Flutter From Learning Flutter",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.all(20),
      ),
    ),
  ));
}
