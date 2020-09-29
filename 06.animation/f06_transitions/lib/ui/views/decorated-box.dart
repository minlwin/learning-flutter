import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class DecoratedBoxDemo extends StatefulWidget {
  static String route = "/decorated-box";
  static String title = "Decorated Box";

  @override
  _DecoratedBoxDemoState createState() => _DecoratedBoxDemoState();
}

class _DecoratedBoxDemoState extends State<DecoratedBoxDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      title: DecoratedBoxDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(controller: _controller),
        body: Center(
          child: DecoratedBoxTransition(
            decoration: _controller.drive(DecorationTween(
              begin: BoxDecoration(
                color: Colors.blue[100],
              ),
              end: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 4),
                    color: Colors.blue[900],
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                ],
              ),
            )),
            child: Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              child: Text(
                "Decoration",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
