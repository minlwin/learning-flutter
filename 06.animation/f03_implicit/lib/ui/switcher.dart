import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class SwitcherDemo extends StatefulWidget {
  static final String title = "Switcher Demo";
  static final String route = "/switcher";

  @override
  _SwitcherDemoState createState() => _SwitcherDemoState();
}

class _SwitcherDemoState extends State<SwitcherDemo> {
  bool _initial = true;

  @override
  Widget build(BuildContext context) {
    return Template(
      title: SwitcherDemo.title,
      body: GestureDetector(
        onTap: () {
          setState(() {
            _initial = !_initial;
          });
        },
        child: Center(
          child: AnimatedSwitcher(
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            duration: Duration(seconds: 1),
            switchInCurve: Curves.easeInExpo,
            switchOutCurve: Curves.elasticOut,
            child: _initial
                ? Image.asset(
                    "images/ww2.png",
                    key: ValueKey("ww2"),
                  )
                : Image.asset(
                    "images/ww3.png",
                    key: ValueKey("ww3"),
                  ),
          ),
        ),
      ),
    );
  }
}
