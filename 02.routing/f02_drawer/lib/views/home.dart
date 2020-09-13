import 'package:f02_drawer/views/widgets/circular-icon.dart';
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              CircularIcons(
                icons: [Icons.thumb_up, Icons.star, Icons.share, Icons.comment],
              )
            ],
          ))
        ],
      ),
    );
  }
}
