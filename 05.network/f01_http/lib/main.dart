import 'package:f01_http/devision-details.dart';
import 'package:f01_http/divisions.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {"/": (_) => Divisions(), "/details": (_) => DivisionDetails()},
      initialRoute: "/",
    );
  }
}
