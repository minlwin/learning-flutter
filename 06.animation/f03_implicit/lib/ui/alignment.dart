import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class AlignmentDemo extends StatefulWidget {
  static final String title = "Alignment Demo";
  static final String route = "/alignment";

  @override
  _AlignmentDemoState createState() => _AlignmentDemoState();
}

class _AlignmentDemoState extends State<AlignmentDemo> {
  AlignmentGeometry _align = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return Template(
      title: AlignmentDemo.title,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: AnimatedAlign(
              alignment: _align,
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              child: SizedBox(
                width: 120,
                child: Image.asset("images/jet.png"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.purple[700],
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Column(
                children: [
                  _row([
                    AlignData("Top Left", Alignment.topLeft),
                    AlignData("Top Center", Alignment.topCenter),
                    AlignData("Top Right", Alignment.topRight),
                  ]),
                  _row([
                    AlignData("Center Left", Alignment.centerLeft),
                    AlignData("Center", Alignment.center),
                    AlignData("Center Right", Alignment.centerRight),
                  ]),
                  _row([
                    AlignData("Btm Left", Alignment.bottomLeft),
                    AlignData("Btm Center", Alignment.bottomCenter),
                    AlignData("Btm Right", Alignment.bottomRight),
                  ]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _row(List<AlignData> names) => Expanded(
      flex: 1,
      child: Row(
        children: names
            .map(
              (e) => Expanded(
                flex: 1,
                child: _button(e),
              ),
            )
            .toList(),
      ));

  _button(AlignData data) => GestureDetector(
        onTap: () {
          setState(() {
            _align = data.align;
          });
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            data.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}

class AlignData {
  final String name;
  final AlignmentGeometry align;

  AlignData(this.name, this.align);
}
