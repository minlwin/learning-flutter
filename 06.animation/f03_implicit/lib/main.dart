import 'package:f03_implicit/ui/alignment.dart';
import 'package:f03_implicit/ui/container.dart';
import 'package:f03_implicit/ui/cross-fade.dart';
import 'package:f03_implicit/ui/home.dart';
import 'package:f03_implicit/ui/opacity.dart';
import 'package:f03_implicit/ui/padding.dart';
import 'package:f03_implicit/ui/physics.dart';
import 'package:f03_implicit/ui/position.dart';
import 'package:f03_implicit/ui/size.dart';
import 'package:f03_implicit/ui/switcher.dart';
import 'package:f03_implicit/ui/text-style.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.route: (_) => Home(),
        ContainerDemo.route: (_) => ContainerDemo(),
        AlignmentDemo.route: (_) => AlignmentDemo(),
        OpacityDemo.route: (_) => OpacityDemo(),
        CrossFadeDemo.route: (_) => CrossFadeDemo(),
        PaddingDemo.route: (_) => PaddingDemo(),
        TextStyleDemo.route: (_) => TextStyleDemo(),
        PositionDemo.route: (_) => PositionDemo(),
        SizeDemo.route: (_) => SizeDemo(),
        PhysicsDemo.route: (_) => PhysicsDemo(),
        SwitcherDemo.route: (_) => SwitcherDemo()
      },
      initialRoute: Home.route,
      debugShowCheckedModeBanner: false,
    );
  }
}
