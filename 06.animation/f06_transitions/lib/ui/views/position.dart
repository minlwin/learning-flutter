import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class PositionDemo extends StatefulWidget {
  static String route = "/position";
  static String title = "Positioned Transition";

  @override
  _PositionDemoState createState() => _PositionDemoState();
}

class _PositionDemoState extends State<PositionDemo>
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
      title: PositionDemo.title,
      body: Stack(
        children: [],
      ),
    );
  }
}
