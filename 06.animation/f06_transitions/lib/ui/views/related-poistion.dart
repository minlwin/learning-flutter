import 'package:f06_transitions/ui/widgets/control-button.dart';
import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class RelatedPositionDemo extends StatefulWidget {
  static String route = "/related-position";
  static String title = "Relative Positions";

  @override
  _RelatedPositionDemoState createState() => _RelatedPositionDemoState();
}

class _RelatedPositionDemoState extends State<RelatedPositionDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final small = 100.0;
    final large = 200.0;

    return Template(
      title: RelatedPositionDemo.title,
      body: Scaffold(
        floatingActionButton: ControlButton(controller: _controller),
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              RelativePositionedTransition(
                rect: RectTween(
                  begin: Rect.fromLTWH(0, 0, large, large),
                  end: Rect.fromLTWH(constraints.biggest.width - small,
                      constraints.biggest.height - small, small, small),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.elasticInOut,
                )),
                size: constraints.biggest,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: FlutterLogo(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
