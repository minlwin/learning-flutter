import 'package:flutter/material.dart';

class ListsBody extends StatelessWidget {
  final List<String> list;

  const ListsBody({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, i) => Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  list[i],
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              color: Colors.blue[100],
            ));
  }
}
