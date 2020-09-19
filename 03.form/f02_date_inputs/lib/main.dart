import 'package:f02_date_inputs/widget/date-input.dart';
import 'package:f02_date_inputs/widget/time-input.dart';
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
          leading: Icon(Icons.calendar_today),
          title: Text("Date Input"),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          child: DateInputForm(),
        ),
      ),
    );
  }
}

class DateInputForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateInputField(),
        TimeInputField(),
      ],
    );
  }
}
