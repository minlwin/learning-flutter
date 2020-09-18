import 'package:f01_text_inputs/widgets.dart';
import 'package:flutter/material.dart';

class OutlineInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(children: [
        OutlineBoxInput(label: "Name"),
        OutlineBoxInput(label: "Password", hidePass: true),
        OutlineBoxInput(label: "Phone", inputType: TextInputType.phone)
      ]),
    );
  }
}
