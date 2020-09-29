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
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _routes = {
    Home.route: (_) => Home(),
    AlignDemo.route: (_) => AlignDemo(),
    DecoratedBoxDemo.route: (_) => DecoratedBoxDemo(),
    DefaultTextDemo.route: (_) => DefaultTextDemo(),
    FadeDemo.route: (_) => FadeDemo(),
    PositionDemo.route: (_) => PositionDemo(),
    RelatedPositionDemo.route: (_) => RelatedPositionDemo(),
    RotationDemo.route: (_) => RotationDemo(),
    ScaleDemo.route: (_) => ScaleDemo(),
    SizeDemo.route: (_) => SizeDemo(),
    SlideDemo.route: (_) => SlideDemo(),
    StatusDemo.route: (_) => StatusDemo()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes,
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
      initialRoute: Home.route,
      debugShowCheckedModeBanner: false,
    );
  }
}
