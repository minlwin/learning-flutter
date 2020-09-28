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
          title: Text("Explicit Animation"),
        ),
        body: RotateBody(),
      ),
    );
  }
}

class RotateBody extends StatefulWidget {
  @override
  _RotateBodyState createState() => _RotateBodyState();
}

class _RotateBodyState extends State<RotateBody>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  IconData _icon = Icons.pause;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(_icon),
        onPressed: () {
          setState(() {
            if (_controller.isAnimating) {
              _controller.stop();
              _icon = Icons.play_arrow;
            } else {
              _controller.repeat();
              _icon = Icons.pause;
            }
          });
        },
      ),
      body: Center(
        child: RotationTransition(
          alignment: Alignment.center,
          turns: _controller,
          child: Image.asset(
            "images/jet.png",
            width: 200,
          ),
        ),
      ),
    );
  }
}
