import 'package:f02_drawer/views/widgets/side-bar.dart';
import 'package:flutter/material.dart';

class ViewBase extends StatelessWidget {
  final String title;
  final Widget body;

  const ViewBase({Key key, this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: SideBar(),
      body: body,
    );
  }
}
