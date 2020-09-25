import 'package:f03_implicit/ui/widgets/side-bar.dart';
import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  final Widget body;
  final String title;
  const Template({Key key, this.title, this.body}) : super(key: key);

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
