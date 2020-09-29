import 'package:flutter/material.dart';

class ControlButton extends StatefulWidget {
  final AnimationController controller;

  const ControlButton({Key key, @required this.controller}) : super(key: key);
  @override
  _ControlButtonState createState() => _ControlButtonState();
}

class _ControlButtonState extends State<ControlButton>
    with SingleTickerProviderStateMixin {
  AnimationController _btnController;

  @override
  void initState() {
    _btnController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          if (widget.controller.isAnimating) {
            widget.controller.stop();
            _btnController.forward();
          } else {
            widget.controller.repeat();
            _btnController.reverse();
          }
        });
      },
      child: AnimatedIcon(
          icon: AnimatedIcons.pause_play, progress: _btnController),
    );
  }
}
