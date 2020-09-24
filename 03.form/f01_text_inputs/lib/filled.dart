import 'package:f01_text_inputs/widgets.dart';
import 'package:flutter/material.dart';

class FilledInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          FilledBoxInput(label: "Name", filledColor: Colors.blue[100]),
          SizedBox(height: 8),
          FilledBoxInput(
              label: "Password", filledColor: Colors.blue[100], hidePass: true),
          SizedBox(height: 8),
          FilledBoxInput(
              label: "Phone",
              filledColor: Colors.blue[100],
              inputType: TextInputType.phone)
        ],
      ),
    );
  }
}
