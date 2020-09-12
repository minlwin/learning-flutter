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
  double _cache;
  String _lastOpe;
  bool _finish = false;

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
    setState(() {
      _cache = (null == _cache)
          ? double.parse(_result)
          : _operateWithDigits(_cache, double.parse(_result), _lastOpe);
      _result = _noZeroFlotString(_cache / 100);
      _temp = "";
      _cache = null;
      _lastOpe = null;
      _finish = true;
    });
  }

  _calculate() {
    setState(() {
      _cache = _operateWithDigits(_cache, double.parse(_result), _lastOpe);
      _temp = "$_temp $_result";
      _result = _noZeroFlotString(_cache);
      _cache = null;
      _lastOpe = null;
      _finish = true;
    });
  }

  _operate(String ope) {
    setState(() {
      if (_cache == null) {
        _cache = double.parse(_result);
      } else {
        _cache = _operateWithDigits(_cache, double.parse(_result), _lastOpe);
      }
      _lastOpe = ope;
      _temp = "$_temp $_result $ope".trim();
      _result = "0";
    });
  }

  _operateWithDigits(double d1, double d2, String ope) {
    double result = 0;

    switch (ope) {
      case "+":
        result = d1 + d2;
        break;
      case "-":
        result = d1 - d2;
        break;
      case "×":
        result = d1 * d2;
        break;
      case "÷":
        result = d1 / d2;
        break;
      default:
        break;
    }

    return result;
  }

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
      _lastOpe = null;
      _cache = null;
    });
  }

  _pressNumber(String value) {
    setState(() {
      if (_result == "0" || _finish) {
        _result = value;
        if (_cache == null) {
          _temp = "";
        }
      } else {
        _result += value;
      }
    });
    _finish = false;
  }

  _noZeroFlotString(double d) {
    double intDouble = d.toInt().toDouble();
    if (intDouble == d) {
      return d.toInt().toString();
    }

    String str = d.toString();
    if (str.length < 11) {
      return str;
    }
    return str.substring(0, 11);
  }
}
