import 'package:f01_http/views/division.list.dart';
import 'package:flutter/material.dart';

class LocationApp extends StatelessWidget {
  const LocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DivisionView(),
    );
  }
}

void main(List<String> args) {
  runApp(const LocationApp());
}
