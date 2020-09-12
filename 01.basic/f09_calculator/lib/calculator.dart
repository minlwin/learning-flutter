import 'package:f09_calculator/display.dart';
import 'package:f09_calculator/keypad.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _temp = "";
  String _result = "0";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: Column(
        children: [
          Expanded(
            child: Display(
              tempStr: _temp,
              resultStr: _result,
            ),
            flex: 1,
          ),
          Expanded(
            child: KeyPad(listner: _pressKey),
            flex: 4,
          )
        ],
      ),
    );
  }

  _pressKey(String value) {
    switch (value) {
      case "C":
        _clear();
        break;
      case "+/-":
        _negate();
        break;
      case ".":
        _makeFloat();
        break;
      case "=":
        _calculate();
        break;
      case "%":
        _makePercent();
        break;
      case "+":
      case "-":
      case "×":
      case "÷":
        _operate(value);
        break;
      default:
        _pressNumber(value);
        break;
    }
  }

  _makePercent() {
    if (_calculateAndUpdateUI()) {}
  }

  _calculate() {}

  bool _calculateAndUpdateUI() {
    return false;
  }

  _operate(String ope) {}

  _makeFloat() {
    if (!_result.contains(".")) {
      setState(() {
        _result = _result + ".";
      });
    }
  }

  _negate() {
    if (_result != "0") {
      setState(() {
        if (_result.startsWith("-")) {
          _result = _result.substring(1);
        } else {
          _result = "-" + _result;
        }
      });
    }
  }

  _clear() {
    setState(() {
      _temp = "";
      _result = "0";
    });
  }

  _pressNumber(String value) {
    setState(() {
      if (_result == "0") {
        _result = value;
      } else {
        _result += value;
      }
    });
  }
}
