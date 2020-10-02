import 'package:f11_hero/model/item-model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Item item;

  const Details({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.name,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              item.brand,
              style: Theme.of(context).textTheme.headline5,
            ),
            Hero(
              tag: item.name,
              child: Image.asset(item.image),
            ),
          ],
        ),
      ),
    );
  }
}
