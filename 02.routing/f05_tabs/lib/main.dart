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
            title: Text("Tab View"),
            bottom: TabBar(tabs: [
              Tab(
                text: "Foods",
                icon: Icon(Icons.fastfood),
              ),
              Tab(
                text: "Coffee",
                icon: Icon(Icons.local_cafe),
              ),
              Tab(
                text: "Flowers",
                icon: Icon(Icons.local_florist),
              ),
            ]),
          ),
          body: TabBarView(children: [
            _view("Foods", Icons.fastfood),
            _view("Coffee", Icons.local_cafe),
            _view("Color", Icons.local_florist),
          ]),
        ),
      ),
    );
  }

  _view(String name, IconData icon) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              icon,
              size: 64,
            )
          ],
        ),
      );
}
