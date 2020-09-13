import 'package:f02_drawer/views/widgets/view-base.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewBase(
      title: "Drawer Demo",
      body: Column(
        children: [
          Placeholder(
            fallbackHeight: 400,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "App Home",
                style: Theme.of(context).textTheme.headline3,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "This is navigation by Navigation Drawer home.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _circularIcon(Icons.thumb_up),
                  _circularIcon(Icons.flag),
                  _circularIcon(Icons.star),
                  _circularIcon(Icons.shop),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  _circularIcon(IconData data) => Container(
        margin: EdgeInsets.only(left: 8),
        child: CircleAvatar(
          child: Icon(data),
        ),
      );
}
