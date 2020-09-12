import 'package:flutter/material.dart';

class GridBody extends StatelessWidget {
  final List<String> list;

  const GridBody({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: list
          .map((e) => Container(
              alignment: Alignment.center,
              color: Colors.blue[100],
              child: Text(
                e,
                style: Theme.of(context).textTheme.headline6,
              )))
          .toList(),
    );
  }
}
