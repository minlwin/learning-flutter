import 'package:f02_pos/template/side-bar.dart';
import 'package:flutter/material.dart';

class TemplateWithDrawer extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton action;

  const TemplateWithDrawer({Key key, this.title, this.body, this.action})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: SideBar(),
      ),
      body: body,
      floatingActionButton: action,
    );
  }
}
