import 'package:f03_implicit/ui/alignment.dart';
import 'package:f03_implicit/ui/container.dart';
import 'package:f03_implicit/ui/cross-fade.dart';
import 'package:f03_implicit/ui/opacity.dart';
import 'package:f03_implicit/ui/padding.dart';
import 'package:f03_implicit/ui/physics.dart';
import 'package:f03_implicit/ui/position.dart';
import 'package:f03_implicit/ui/size.dart';
import 'package:f03_implicit/ui/switcher.dart';
import 'package:f03_implicit/ui/text-style.dart';
import 'package:f03_implicit/ui/widgets/menu-item.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/");
            },
            child: _header(context),
          ),
          MenuItem(
            name: TextStyleDemo.title,
            route: TextStyleDemo.route,
          ),
          MenuItem(
            name: ContainerDemo.title,
            route: ContainerDemo.route,
          ),
          MenuItem(
            name: OpacityDemo.title,
            route: OpacityDemo.route,
          ),
          MenuItem(
            name: CrossFadeDemo.title,
            route: CrossFadeDemo.route,
          ),
          MenuItem(
            name: PaddingDemo.title,
            route: PaddingDemo.route,
          ),
          MenuItem(
            name: AlignmentDemo.title,
            route: AlignmentDemo.route,
          ),
          MenuItem(
            name: SizeDemo.title,
            route: SizeDemo.route,
          ),
          MenuItem(
            name: SwitcherDemo.title,
            route: SwitcherDemo.route,
          ),
          MenuItem(
            name: PositionDemo.title,
            route: PositionDemo.route,
          ),
          MenuItem(
            name: PhysicsDemo.title,
            route: PhysicsDemo.route,
          ),
        ],
      ),
    );
  }

  _header(BuildContext context) => UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.red[200],
              Colors.green[200],
              Colors.yellow[300],
              Colors.blue,
            ],
            center: Alignment.bottomLeft,
            radius: 1.4,
          ),
        ),
        accountName: Text(
          "Animation",
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Colors.white, shadows: [
            Shadow(
              blurRadius: 0.4,
              color: Colors.grey,
              offset: Offset.fromDirection(4, 2),
            )
          ]),
        ),
        accountEmail: Text(
          "Implicit Animation",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.red[900]),
        ),
      );
}
