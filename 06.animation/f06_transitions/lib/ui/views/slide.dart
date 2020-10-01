import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class SlideDemo extends StatefulWidget {
  static String route = "/slide";
  static String title = "Slide Transition";

  @override
  _SlideDemoState createState() => _SlideDemoState();
}

class _SlideDemoState extends State<SlideDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat(reverse: true);
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
      title: SlideDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(controller: _controller),
        body: SlideTransition(
          position: Tween(
            begin: Offset.zero,
            end: Offset(1.5, 0),
          ).animate(
              CurvedAnimation(parent: _controller, curve: Curves.elasticIn)),
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Positioned(
                  left: 80,
                  child: FlutterLogo(
                    size: 120,
                  ),
                ),
                Image.asset("images/bike.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
