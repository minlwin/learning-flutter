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
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Happy Life",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                background: Image.asset(
                  "images/raider.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
          body: Center(
            child: Text(
              "Hello Sliver App Bar",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }
}
