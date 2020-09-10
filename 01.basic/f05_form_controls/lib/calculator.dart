import 'package:flutter/material.dart';

typedef double Calculate(String str1, String str2);

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final formState = GlobalKey<FormState>();
  final digit1 = TextEditingController();
  final digit2 = TextEditingController();

  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _formField(digit1, "Digit 1"),
                        _formField(digit2, "Digit 2"),
                      ],
                    ),
                  ),
                ),
                _buttons(),
                _resultArea()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _resultArea() => Card(
        color: Colors.blue[200],
        child: Container(
          height: 100,
          child: Center(
              child: Text(
            "$result",
            style: TextStyle(fontSize: 30),
          )),
        ),
      );

  Widget _buttons() => Row(
        children: [
          _calculator("Plus", (a, b) => double.parse(a) + double.parse(b)),
          _calculator("Minus", (a, b) => double.parse(a) - double.parse(b)),
          _calculator("Times", (a, b) => double.parse(a) * double.parse(b)),
          _calculator("Divided", (a, b) => double.parse(a) / double.parse(b)),
        ],
      );

  Widget _calculator(String sign, Calculate calc) => Container(
        color: Colors.blue[300],
        margin: EdgeInsets.all(8),
        height: 40,
        child: GestureDetector(
          onTap: () {
            if (formState.currentState.validate()) {
              setState(() {
                result = calc(digit1.text, digit2.text);
              });
            }
          },
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(sign),
          )),
        ),
      );

  Widget _formField(TextEditingController controller, String fieldName) =>
      TextFormField(
          controller: controller,
          decoration: InputDecoration(labelText: "Enter Digit $fieldName"),
          keyboardType: TextInputType.number,
          validator: (value) =>
              value.isEmpty ? "Please enter $fieldName" : null);
}
