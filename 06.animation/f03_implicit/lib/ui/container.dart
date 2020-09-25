import 'dart:math';

import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class ContainerDemo extends StatefulWidget {
  static final String title = "Container Demo";
  static final String route = "/container";

  @override
  _ContainerDemoState createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  final Random _random = Random();
  double _width = 200;
  double _height = 200;
  double _radius = 100;
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Template(
      title: ContainerDemo.title,
      body: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _changeState,
          child: Icon(Icons.autorenew),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(_radius),
            ),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutExpo,
          ),
        ),
      ),
    );
  }

  _changeState() {
    setState(() {
      _width = _random.nextInt(300).toDouble();
      _height = _random.nextInt(300).toDouble();
      _radius = _random.nextInt(150).toDouble();
      _color = Color.fromRGBO(
        _random.nextInt(255),
        _random.nextInt(255),
        _random.nextInt(255),
        1,
      );
    });
  }
}
