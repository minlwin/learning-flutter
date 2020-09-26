import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class SizeDemo extends StatefulWidget {
  static final String title = "Size Demo";
  static final String route = "/size";

  @override
  _SizeDemoState createState() => _SizeDemoState();
}

class _SizeDemoState extends State<SizeDemo>
    with SingleTickerProviderStateMixin {
  double _sildeValue = 100;
  @override
  Widget build(BuildContext context) {
    return Template(
      title: SizeDemo.title,
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: Center(
                child: AnimatedSize(
                  duration: Duration(milliseconds: 1),
                  vsync: this,
                  child: Image.asset(
                    "images/jet.png",
                    width: _sildeValue,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Change Size",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Slider(
                  value: _sildeValue,
                  onChanged: (value) {
                    setState(() {
                      _sildeValue = value;
                    });
                  },
                  min: 30,
                  max: 300,
                ),
                Text(
                  "Size : ${_sildeValue.toInt()}",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
