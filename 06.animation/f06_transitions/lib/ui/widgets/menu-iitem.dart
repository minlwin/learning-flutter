import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final String route;

  const MenuItem({Key key, @required this.name, @required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: ListTile(
        trailing: Icon(Icons.send),
        title: Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
