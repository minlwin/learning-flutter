import 'package:flutter/material.dart';

class FilledInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          _filled(TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              contentPadding: EdgeInsets.all(8),
            ),
            keyboardType: TextInputType.name,
          )),
          _filled(TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              contentPadding: EdgeInsets.all(8),
            ),
            obscureText: true,
          )),
          _filled(TextFormField(
            decoration: InputDecoration(
              labelText: "Phone",
              contentPadding: EdgeInsets.all(8),
            ),
            keyboardType: TextInputType.phone,
          )),
        ],
      ),
    );
  }

  _filled(Widget input) => Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: input,
      );
}
