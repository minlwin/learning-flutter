import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Animation"),
        ),
        body: HelloAnimation(),
      ),
    );
  }
}

class HelloAnimation extends StatefulWidget {
  @override
  _HelloAnimationState createState() => _HelloAnimationState();
}

class _HelloAnimationState extends State<HelloAnimation> {
  bool initial = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
            child: CircleAvatar(
              radius: initial ? 40 : 120,
              backgroundColor: initial ? Colors.red : Colors.blue,
              child: RotatedBox(
                quarterTurns: initial ? 0 : 3,
                child: Icon(
                  Icons.thumb_up,
                  size: initial ? 40 : 120,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          FlatButton(
              onPressed: () {
                setState(() {
                  initial = !initial;
                });
              },
              child: Text("Animate"))
        ],
      ),
    );
  }
}
