import 'package:f01_text_inputs/default.dart';
import 'package:f01_text_inputs/filled.dart';
import 'package:f01_text_inputs/outline.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Text Input"),
            bottom: TabBar(tabs: [
              Tab(child: Text("Default")),
              Tab(child: Text("Filled")),
              Tab(child: Text("Outline")),
            ]),
          ),
          body: TabBarView(children: [
            DefaultInputs(),
            FilledInputs(),
            OutlineInputs(),
          ]),
        ),
      ),
    );
  }
}
