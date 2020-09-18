import 'package:flutter/material.dart';

class OutlineInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
