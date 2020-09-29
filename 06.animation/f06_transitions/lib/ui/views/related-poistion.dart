import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class RelatedPositionDemo extends StatefulWidget {
  static String route = "/related-position";
  static String title = "Related Positions";

  @override
  _RelatedPositionDemoState createState() => _RelatedPositionDemoState();
}

class _RelatedPositionDemoState extends State<RelatedPositionDemo>
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
      title: RelatedPositionDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(controller: _controller),
        body: Container(),
      ),
    );
  }
}
