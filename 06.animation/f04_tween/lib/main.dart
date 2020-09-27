import 'dart:math' as math;

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
          title: Text("Tween Animation"),
        ),
        body: TweenDemo(),
      ),
    );
  }
}

class TweenDemo extends StatefulWidget {
  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> {
  bool _state = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          key: ValueKey(_state),
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 1200),
          curve: Curves.fastOutSlowIn,
          builder: (context, value, child) => Transform.rotate(
            angle: value * math.pi * 2 * (_state ? 1 : -1),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _state = !_state;
                });
              },
              child: Image.asset(
                "images/jet.png",
                width: 200,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(36),
          child: Text(
            "Tap Image",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }
}
