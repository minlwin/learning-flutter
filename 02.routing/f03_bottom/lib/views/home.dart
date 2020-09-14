import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("images/jdc-logo.png"),
            fit: BoxFit.contain,
            height: 240,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Java Developer Class",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'AbrilFatface',
                  color: Colors.blue[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "No 66/68B,1st Floor,SanYeikNyein(6)street, Kamayut Yangon.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold),
            ),
          ),
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
            label: Text("Student Login"),
            color: Colors.purple[100],
          )
        ],
      ),
    );
  }
}
