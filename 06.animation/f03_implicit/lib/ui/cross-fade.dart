import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class CrossFadeDemo extends StatefulWidget {
  static final String title = "Cross Fade Demo";
  static final String route = "/cross-fade";

  @override
  _CrossFadeDemoState createState() => _CrossFadeDemoState();
}

class _CrossFadeDemoState extends State<CrossFadeDemo> {
  bool _first = true;
  @override
  Widget build(BuildContext context) {
    return Template(
      title: CrossFadeDemo.title,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            AnimatedCrossFade(
              firstChild: Container(
                color: Colors.white,
                child: Image.asset("images/stop-covid.png"),
              ),
              secondChild: Image.asset("images/stay-at-home.png"),
              crossFadeState:
                  _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(seconds: 2),
              firstCurve: Curves.easeInOutCirc,
              secondCurve: Curves.bounceInOut,
            ),
            Container(
              width: 160,
              alignment: Alignment.center,
              color: Colors.red,
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _first = !_first;
                    });
                  },
                  child: Text(
                    _first ? "Stop It" : "You don't",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
