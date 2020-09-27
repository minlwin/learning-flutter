import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class PhysicsDemo extends StatefulWidget {
  static final String title = "Physics Model";
  static final String route = "/physics";

  @override
  _PhysicsDemoState createState() => _PhysicsDemoState();
}

class _PhysicsDemoState extends State<PhysicsDemo> {
  bool _state = true;

  @override
  Widget build(BuildContext context) {
    return Template(
      title: PhysicsDemo.title,
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _state = !_state;
            });
          },
          child: AnimatedPhysicalModel(
            shape: BoxShape.circle,
            color: _state ? Colors.grey : Colors.yellow,
            elevation: _state ? 10 : 30,
            shadowColor: _state ? Colors.blue : Colors.red,
            duration: Duration(seconds: 1),
            child: Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(24),
              child: Image.asset("images/jet.png"),
            ),
          ),
        ),
      ),
    );
  }
}
