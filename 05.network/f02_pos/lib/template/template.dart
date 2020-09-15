import 'package:f02_pos/template/side-bar.dart';
import 'package:flutter/material.dart';

class TemplateWithDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      drawer: Drawer(
        child: SideBar(),
      ),
    );
  }
}
