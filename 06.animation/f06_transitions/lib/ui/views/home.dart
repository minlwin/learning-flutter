import 'package:f06_transitions/ui/widgets/template.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static String route = "/";
  static String title = "Transitions";
  @override
  Widget build(BuildContext context) {
    return Template(
      title: title,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 200,
            ),
            Text(
              "Transitions",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              "Learning Flutter",
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
