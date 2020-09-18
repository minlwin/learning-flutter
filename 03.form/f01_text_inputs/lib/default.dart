import 'package:flutter/material.dart';

class DefaultInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: "Name"),
            keyboardType: TextInputType.name,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Phone"),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
