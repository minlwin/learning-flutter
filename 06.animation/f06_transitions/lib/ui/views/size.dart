import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class SizeDemo extends StatefulWidget {
  static String route = "/size";
  static String title = "Size Transition";

  @override
  _SizeDemoState createState() => _SizeDemoState();
}

class _SizeDemoState extends State<SizeDemo>
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
  Widget build(BuildContext context) {
    return Template(
      title: SizeDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(
          controller: _controller,
        ),
        body: Center(
          child: SizeTransition(
            sizeFactor: Tween(begin: 1.0, end: 0.0).animate(_controller),
            child: SizeTransition(
              sizeFactor: Tween(begin: 0.0, end: 1.0).animate(_controller),
              axis: Axis.horizontal,
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
