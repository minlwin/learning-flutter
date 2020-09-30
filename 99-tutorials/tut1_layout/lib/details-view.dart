import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          Text(
            "Riding on Sunny Day!",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 16),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                child: Image.asset("images/raider.jpg"),
                borderRadius: BorderRadius.circular(8),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "BORN TO RIDE",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.yellow,
                          ),
                    ),
                    Text(
                      "COUNT ME",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.event,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      "2020/10/10",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.green),
                  Icon(Icons.star, color: Colors.green),
                  Icon(Icons.star, color: Colors.green),
                  Icon(Icons.star_half, color: Colors.green),
                  Icon(Icons.star_border, color: Colors.green),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          Text(
            "Come & Join Us!",
            style: Theme.of(context).textTheme.headline5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.monetization_on,
                color: Colors.red[300],
              ),
              SizedBox(width: 8),
              Text(
                "180,000 MMK",
                style: TextStyle(fontSize: 18, color: Colors.red[300]),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _event(Colors.green[50], Colors.black, "6:00 AM",
                          "Let's go!", "Yangon"),
                      _event(Colors.green[200], Colors.black, "7:30 AM",
                          "Coffee Time", "Phyuu"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _event(Colors.green[500], Colors.white, "11:30 AM",
                          "Lunch Time", "Taungu"),
                      _event(Colors.green[700], Colors.white, "17:00 PM",
                          "Goal!", "Mandalay"),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _event(Color color, Color text, String time, String title, String location) =>
      Expanded(
        child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.schedule,
                      color: text,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            color: text,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            color: text,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    location,
                    style: TextStyle(
                      color: text,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
