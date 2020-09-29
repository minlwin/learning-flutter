import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class FadeDemo extends StatefulWidget {
  static String route = "/fade";
  static String title = "Fade Transition";

  @override
  _FadeDemoState createState() => _FadeDemoState();
}

class _FadeDemoState extends State<FadeDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
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
      title: FadeDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(controller: _controller),
        body: FadeTransition(
          opacity: Tween(
            begin: 1.0,
            end: 0.0,
          ).animate(CurvedAnimation(
              parent: _controller, curve: Curves.fastOutSlowIn)),
          child: Container(
            margin:
                EdgeInsets.only(top: 200, left: 20, bottom: 200, right: 100),
            color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              "Fade Demo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            transform: Matrix4.skew(0.1, -0.1),
          ),
        ),
      ),
    );
  }
}
