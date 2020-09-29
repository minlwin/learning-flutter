import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class AlignDemo extends StatefulWidget {
  static String route = "/algin";
  static String title = "Align Transition";

  @override
  _AlignDemoState createState() => _AlignDemoState();
}

class _AlignDemoState extends State<AlignDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  IconData _iconData = Icons.pause;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      reverseDuration: Duration(seconds: 3),
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
      title: AlignDemo.title,
      body: Scaffold(
        floatingActionButton: _button(),
        body: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: AlignTransition(
            alignment:
                Tween(begin: Alignment.bottomLeft, end: Alignment.topRight)
                    .animate(_controller),
            child: SizedBox(
              width: 150,
              height: 150,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _button() => FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.isAnimating) {
              _controller.stop();
              _iconData = Icons.play_arrow;
            } else {
              _controller.repeat();
              _iconData = Icons.pause;
            }
          });
        },
        child: Icon(_iconData),
      );
}
