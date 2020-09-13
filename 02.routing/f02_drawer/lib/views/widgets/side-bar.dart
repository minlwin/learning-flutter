import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(children: [
            Placeholder(
              fallbackHeight: 200,
            ),
          ]),
          _menuItem(context, "Home", icon: Icons.home, path: "/"),
          _menuItem(context, "Profile",
              icon: Icons.account_circle, path: "/profile"),
          _menuItem(context, "Galary",
              icon: Icons.photo_library, path: "/galary"),
          _menuItem(context, "Settings",
              icon: Icons.settings, path: "/settings"),
        ],
      ),
    );
  }

  _menuItem(BuildContext context, String name, {String path, IconData icon}) =>
      GestureDetector(
        onTap: () {
          _route(context, path);
        },
        child: ListTile(
          leading: Icon(icon),
          title: Text(name),
        ),
      );

  _route(BuildContext context, String path) {
    Navigator.of(context).pushReplacementNamed(path);
  }
}
