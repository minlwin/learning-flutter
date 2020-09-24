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
        child: Column(
          children: [
            _resultArea(),
            _inputs(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  _resultArea() => Card(
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

  _buttons() => Row(
        children: [
          _button("Plus", (a, b) => double.parse(a) + double.parse(b)),
          _button("Minus", (a, b) => double.parse(a) - double.parse(b)),
          _button("Times", (a, b) => double.parse(a) * double.parse(b)),
          _button("Divided", (a, b) => double.parse(a) / double.parse(b)),
        ],
      );

  _button(String sign, Calculate calc) => Expanded(
        child: Container(
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
        ),
      );

  _inputs() => Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _input(digit1, "Digit 1"),
              _input(digit2, "Digit 2"),
            ],
          ),
        ),
      );

  Widget _input(TextEditingController controller, String fieldName) =>
      TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: "Enter Digit $fieldName"),
        keyboardType: TextInputType.number,
        validator: (value) => value.isEmpty ? "Please enter $fieldName" : null,
      );
}
