import 'package:flutter/material.dart';

class Expensions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      child: ListView.separated(
        itemBuilder: (context, index) => ExpansionTile(
          title: Text("Item ${index + 1}"),
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 72),
              child: Text("Do something for this item."),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                )
              ],
            )
          ],
          expandedAlignment: Alignment.topLeft,
        ),
        separatorBuilder: (context, index) => Container(
          color: Colors.grey,
          height: 1,
        ),
        itemCount: 10,
      ),
    );
  }
}
