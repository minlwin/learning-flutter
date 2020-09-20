import 'package:f03_dropdowns/dropdown-custom.dart';
import 'package:f03_dropdowns/dropdown-data.dart';
import 'package:f03_dropdowns/dropdown-input.dart';
import 'package:f03_dropdowns/dropdwon-button.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dropdown Demo"),
        ),
        body: DropdownData(
          list: ["Android", "iOS", "Flutter", "Dart"],
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ComboBoxButton(),
                Container(
                  height: 16,
                ),
                ComboBoxFormField(),
                Container(
                  height: 16,
                ),
                ComboBoxCustomFormField()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
