import 'package:f01_text_inputs/widgets.dart';
import 'package:flutter/material.dart';

class DefaultInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          BasicInput(label: "Name"),
          BasicInput(label: "Password", hidePass: true),
          BasicInput(label: "Phone", inputType: TextInputType.phone),
        ],
      ),
    );
  }
}
