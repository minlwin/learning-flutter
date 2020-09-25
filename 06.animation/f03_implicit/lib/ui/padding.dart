import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class PaddingDemo extends StatefulWidget {
  static final String title = "Padding Demo";
  static final String route = "/padding";

  @override
  _PaddingDemoState createState() => _PaddingDemoState();
}

class _PaddingDemoState extends State<PaddingDemo> {
  double _value = 10;
  @override
  Widget build(BuildContext context) {
    return Template(
      title: PaddingDemo.title,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                color: Colors.purple,
                child: AnimatedPadding(
                  padding: EdgeInsets.all(_value),
                  duration: Duration(microseconds: 500),
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Slide This",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Slider(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    min: 0,
                    max: 120,
                  ),
                  Text("Padding : ${_value.toInt()}")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
