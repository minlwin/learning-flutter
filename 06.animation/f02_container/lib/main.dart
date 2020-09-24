import 'dart:math';

import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  double _width = 100;
  double _height = 100;
  double _radius = 20;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Animation"),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_radius),
          ),
          duration: Duration(
            seconds: 1,
          ),
          curve: Curves.easeInOutExpo,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Random random = Random();

            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(400).toDouble();
            _radius = random.nextInt(100).toDouble();

            _color = Color.fromARGB(
              255,
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
            );
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
