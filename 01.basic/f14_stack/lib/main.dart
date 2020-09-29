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
        body: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Child(width: 200, color: Colors.blue),
              Positioned(
                bottom: -50,
                right: -50,
                child: Child(width: 160, color: Colors.yellow),
              ),
              Positioned(
                right: -80,
                top: 50,
                child: Child(width: 120, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  final double width;
  final Color color;
  const Child({Key key, @required this.width, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      color: color,
    );
  }
}
