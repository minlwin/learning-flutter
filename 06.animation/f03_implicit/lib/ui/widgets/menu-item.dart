import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final String route;

  const MenuItem({Key key, this.name, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
        trailing: Icon(Icons.send),
      ),
    );
  }
}
