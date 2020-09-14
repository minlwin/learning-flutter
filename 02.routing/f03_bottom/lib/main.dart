import 'package:f03_bottom/views/course-details.dart';
import 'package:f03_bottom/views/courses.dart';
import 'package:f03_bottom/views/home.dart';
import 'package:f03_bottom/views/schedules.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final List<NavData> navigations = [
    NavData("JDC", Icons.home, Home()),
    NavData("Course", Icons.school, Courses()),
    NavData("Class", Icons.schedule, Schedules()),
  ];

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    NavData current = widget.navigations[_index];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple[600]),
      routes: {
        "/course/details": (_) => CourseDetails(),
      },
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(current.icon),
          title: Text(current.title),
          centerTitle: false,
        ),
        body: current.content,
        bottomNavigationBar: BottomNavigationBar(
          items: widget.navigations
              .map((e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    title: Text(e.title),
                  ))
              .toList(),
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
        ),
      ),
    );
  }
}

class NavData {
  String title;
  IconData icon;
  Widget content;

  NavData(this.title, this.icon, this.content);
}
