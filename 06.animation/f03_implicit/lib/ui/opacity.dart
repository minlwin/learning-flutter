import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class OpacityDemo extends StatefulWidget {
  static final String title = "Opacity Demo";
  static final String route = "/opacity";

  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Template(
      title: OpacityDemo.title,
      body: Center(
        child: Column(
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _show ? 1 : 0,
              child: Image.asset("images/stop-covid.png"),
              curve: Curves.easeInCubic,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _show = !_show;
                });
              },
              child: Container(
                width: 160,
                alignment: Alignment.center,
                child: Text(
                  _show ? "HIDE" : "SHOW",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
              ),
              color: Colors.red[300],
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            )
          ],
        ),
      ),
    );
  }
}
