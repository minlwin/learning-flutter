import 'package:f11_hero/details.dart';
import 'package:f11_hero/model/item-model.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: ItemRepo.getItems().length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => Details(
                  item: ItemRepo.getItems()[index],
                ),
                transitionsBuilder: (_, animation, __, child) => FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: Curves.bounceInOut,
                  ),
                  child: child,
                ),
              ),
            );
          },
          child: Card(
            color: Colors.grey[300],
            child: Hero(
              tag: ItemRepo.getItems()[index].name,
              child: Image.asset(ItemRepo.getItems()[index].image),
            ),
          ),
        ),
      ),
    );
  }
}
