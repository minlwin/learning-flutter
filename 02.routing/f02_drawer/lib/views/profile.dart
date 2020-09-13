import 'package:f02_drawer/views/widgets/view-base.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewBase(
      title: "Profile",
      body: _body(context),
    );
  }

  _body(BuildContext ctx) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "Nick Name",
                style: Theme.of(ctx).textTheme.headline3,
              ),
            ),
            Placeholder(
              fallbackHeight: 300,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 24, left: 16),
              child: Text(
                "About Me",
                style: Theme.of(ctx).textTheme.headline4,
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("User Name"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Phone Number"),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email Address"),
            )
          ],
        ),
      );
}
