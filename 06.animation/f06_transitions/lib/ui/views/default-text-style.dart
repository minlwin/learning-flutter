import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class DefaultTextDemo extends StatefulWidget {
  static String route = "/default-text";
  static String title = "Default Text Style";

  @override
  _DefaultTextDemoState createState() => _DefaultTextDemoState();
}

class _DefaultTextDemoState extends State<DefaultTextDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
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
      title: DefaultTextDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(controller: _controller),
        body: Center(
          child: DefaultTextStyleTransition(
              style: _controller.drive(TextStyleTween(
                begin: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                ),
                end: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              )),
              textAlign: TextAlign.center,
              child: Text("Learning Flutter")),
        ),
      ),
    );
  }
}
