import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class StatusDemo extends StatefulWidget {
  static String route = "/status";
  static String title = "Status Transition";

  @override
  _StatusDemoState createState() => _StatusDemoState();
}

class _StatusDemoState extends State<StatusDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
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
      title: StatusDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(controller: _controller),
        body: Container(),
      ),
    );
  }
}
