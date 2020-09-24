import 'package:f01_text_inputs/widgets.dart';
import 'package:flutter/material.dart';

class OutlineInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(children: [
        OutlineBoxInput(label: "Name"),
        SizedBox(height: 8),
        OutlineBoxInput(label: "Password", hidePass: true),
        SizedBox(height: 8),
        OutlineBoxInput(label: "Phone", inputType: TextInputType.phone)
      ]),
    );
  }
}
