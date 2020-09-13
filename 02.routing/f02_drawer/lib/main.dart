import 'package:f02_drawer/views/galary.dart';
import 'package:f02_drawer/views/home.dart';
import 'package:f02_drawer/views/profile.dart';
import 'package:f02_drawer/views/settings.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => Home(),
        "/profile": (_) => Profile(),
        "/galary": (_) => Galary(),
        "/settings": (_) => Settings(),
      },
      initialRoute: "/",
    );
  }
}
