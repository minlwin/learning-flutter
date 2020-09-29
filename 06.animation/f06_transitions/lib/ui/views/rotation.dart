import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class RotationDemo extends StatefulWidget {
  static String route = "/rotation";
  static String title = "Rotation Transition";

  @override
  _RotationDemoState createState() => _RotationDemoState();
}

class _RotationDemoState extends State<RotationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 15))
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
      title: RotationDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(controller: _controller),
        body: Center(
          child: RotationTransition(
            turns: _controller.drive(Tween(begin: 1.0, end: 0.0)),
            child: Container(width: 200, height: 200, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
