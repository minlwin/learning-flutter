import 'package:f02_drawer/views/widgets/view-base.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewBase(
      title: "Settings",
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("images/logo2017.png")),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Settings",
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
