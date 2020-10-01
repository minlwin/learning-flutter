import 'dart:math' as Maths;

import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _state = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Animated Builder",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 60,
          ),
          _animation(),
        ],
      ),
    );
  }

  _animation() => AnimatedBuilder(
        animation:
            CurvedAnimation(parent: _controller, curve: Curves.easeInToLinear),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _state = !_state;

              if (_state) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.amber[100],
            alignment: Alignment.center,
            child: FlutterLogo(
              size: 160,
            ),
          ),
        ),
        builder: (context, child) => Transform.rotate(
          angle: _controller.value * Maths.pi,
          child: child,
        ),
      );
}
