import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final IconData data;

  const CircularIcon({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: CircleAvatar(
        child: Icon(data),
      ),
    );
  }
}

class CircularIcons extends StatelessWidget {
  final List<IconData> icons;

  const CircularIcons({Key key, this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: icons
          .map((e) => CircularIcon(
                data: e,
              ))
          .toList(),
    );
  }
}
