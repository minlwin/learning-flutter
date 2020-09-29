import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class ScaleDemo extends StatefulWidget {
  static String route = "/scale";
  static String title = "Scale Transition";

  @override
  _ScaleDemoState createState() => _ScaleDemoState();
}

class _ScaleDemoState extends State<ScaleDemo>
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
      title: ScaleDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(
          controller: _controller,
        ),
        body: Center(
          child: ScaleTransition(
            scale: Tween(begin: 0.5, end: 2.0).animate(_controller),
            child: Container(
              color: Colors.blue,
              width: 150,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
