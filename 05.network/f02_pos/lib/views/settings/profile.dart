import 'package:f02_pos/template/template.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  static final String navigationId = "/about-me";
  @override
  Widget build(BuildContext context) {
    return TemplateWithDrawer(
      title: "About Me",
      body: Container(),
    );
  }
}
