import 'package:f06_transitions/ui/views/align.dart';
import 'package:f06_transitions/ui/views/decorated-box.dart';
import 'package:f06_transitions/ui/views/default-text-style.dart';
import 'package:f06_transitions/ui/views/fade.dart';
import 'package:f06_transitions/ui/views/home.dart';
import 'package:f06_transitions/ui/views/position.dart';
import 'package:f06_transitions/ui/views/related-poistion.dart';
import 'package:f06_transitions/ui/views/rotation.dart';
import 'package:f06_transitions/ui/views/scale.dart';
import 'package:f06_transitions/ui/views/size.dart';
import 'package:f06_transitions/ui/views/slide.dart';
import 'package:f06_transitions/ui/views/status.dart';
import 'package:f06_transitions/ui/widgets/menu-iitem.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _header(context),
          MenuItem(name: AlignDemo.title, route: AlignDemo.route),
          MenuItem(name: ScaleDemo.title, route: ScaleDemo.route),
          MenuItem(name: SizeDemo.title, route: SizeDemo.route),
          MenuItem(name: FadeDemo.title, route: FadeDemo.route),
          MenuItem(name: RotationDemo.title, route: RotationDemo.route),
          MenuItem(name: DefaultTextDemo.title, route: DefaultTextDemo.route),
          MenuItem(name: DecoratedBoxDemo.title, route: DecoratedBoxDemo.route),
          MenuItem(name: PositionDemo.title, route: PositionDemo.route),
          MenuItem(
              name: RelatedPositionDemo.title,
              route: RelatedPositionDemo.route),
          MenuItem(name: SlideDemo.title, route: SlideDemo.route),
          MenuItem(name: StatusDemo.title, route: StatusDemo.route),
        ],
      ),
    );
  }

  _header(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, Home.route);
        },
        child: UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(
              "T",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          accountName: Text(
            "Transitions",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
          accountEmail: Text(
            "Learning Flutter",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
}
