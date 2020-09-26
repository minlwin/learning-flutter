import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class PhysicsDemo extends StatefulWidget {
  static final String title = "Physics Model";
  static final String route = "/physics";

  @override
  _PhysicsDemoState createState() => _PhysicsDemoState();
}

class _PhysicsDemoState extends State<PhysicsDemo> {
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Template(
      title: PhysicsDemo.title,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset("images/jet.png"),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Text("Slide Here"),
              Slider(
                value: _sliderValue,
                onChanged: (value) {},
                min: 20,
                max: 300,
              )
            ],
          ))
        ],
      ),
    );
  }
}
