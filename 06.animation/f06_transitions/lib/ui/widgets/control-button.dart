import 'package:flutter/material.dart';

class ControlButton extends StatefulWidget {
  final AnimationController controller;

  const ControlButton({Key key, @required this.controller}) : super(key: key);
  @override
  _ControlButtonState createState() => _ControlButtonState();
}

class _ControlButtonState extends State<ControlButton> {
  IconData _iconData = Icons.pause;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          if (widget.controller.isAnimating) {
            widget.controller.stop();
            _iconData = Icons.play_arrow;
          } else {
            widget.controller.repeat();
            _iconData = Icons.pause;
          }
        });
      },
      child: Icon(_iconData),
    );
  }
}
