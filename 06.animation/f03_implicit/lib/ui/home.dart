import 'package:f03_implicit/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static final String title = "Implicit Animation";
  static final String route = "/";
  @override
  Widget build(BuildContext context) {
    return Template(
      title: title,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Image.asset("images/implicit-animation.png"),
      ),
    );
  }
}
