import 'package:f02_drawer/views/widgets/view-base.dart';
import 'package:flutter/material.dart';

class Galary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewBase(
      title: "Galarry",
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(20, (index) => _item(index)),
        ),
      ),
    );
  }

  _item(int number) => Card(
      color: Colors.blue[100],
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child: Placeholder()),
            Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "Number ${number + 1}",
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
      ));
}
