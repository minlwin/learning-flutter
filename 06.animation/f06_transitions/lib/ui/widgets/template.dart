import 'package:f06_transitions/ui/widgets/side-bar.dart';
import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  final String title;
  final Widget body;

  const Template({Key key, @required this.title, @required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      drawer: Drawer(
        child: SideBar(),
      ),
    );
  }
}
