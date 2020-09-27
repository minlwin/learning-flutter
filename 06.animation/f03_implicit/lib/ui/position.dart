import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class PositionDemo extends StatefulWidget {
  static final String title = "Position Demo";
  static final String route = "/position";

  @override
  _PositionDemoState createState() => _PositionDemoState();
}

class _PositionDemoState extends State<PositionDemo> {
  double _left = 0;
  double _top = 0;

  @override
  Widget build(BuildContext context) {
    return Template(
      title: PositionDemo.title,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue[100],
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutCubic,
              left: _left,
              top: _top,
              width: 160,
              child: Image.asset("images/jet.png"),
            ),
            GestureDetector(
              onTapDown: (d) {
                setState(() {
                  _setLeft(d.localPosition.dx);
                  _setTop(d.localPosition.dy);
                });
              },
            )
          ],
        ),
      ),
    );
  }

  _setTop(double data) {
    double top = data - 100 < 0 ? 0 : data - 100;
    double maxTop = MediaQuery.of(context).size.height - 260;
    _top = top > maxTop ? maxTop : top;
  }

  _setLeft(double data) {
    double left = data - 80 < 0 ? 0 : data - 80;
    double maxLeft = MediaQuery.of(context).size.width - 160;
    _left = left > maxLeft ? maxLeft : left;
  }
}
