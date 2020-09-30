import 'package:flutter/material.dart';
import 'package:layout_demo/details-view.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.red,
        accentColor: Colors.green,
        colorScheme: ColorScheme.dark(),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text("The Bikers"),
        ),
        body: DetailsView(),
      ),
    );
  }
}
