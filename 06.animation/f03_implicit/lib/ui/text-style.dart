import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class TextStyleDemo extends StatefulWidget {
  static final String title = "Text Style Demo";
  static final String route = "/text";

  @override
  _TextStyleDemoState createState() => _TextStyleDemoState();
}

class _TextStyleDemoState extends State<TextStyleDemo> {
  bool _default = true;

  @override
  Widget build(BuildContext context) {
    return Template(
      title: TextStyleDemo.title,
      body: GestureDetector(
        onTap: () {
          setState(() {
            _default = !_default;
          });
        },
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: Duration(seconds: 1),
            style: _default
                ? Theme.of(context).textTheme.headline3
                : Theme.of(context).textTheme.headline1.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                    ),
            child: Text(
              "Stop Covit 19!",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
