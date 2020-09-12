import 'package:flutter/material.dart';

typedef KeyListener(String key);

class KeyPad extends StatelessWidget {
  final KeyListener listner;

  const KeyPad({Key key, this.listner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
          color: Colors.blue[700],
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400],
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          _row([
            KeyCodeValue("C", Colors.orange[300]),
            KeyCodeValue("+/-", Colors.orange[300]),
            KeyCodeValue("%", Colors.orange[300]),
            KeyCodeValue("÷", Colors.amber[100]),
          ]),
          _row([
            KeyCodeValue.$("7"),
            KeyCodeValue.$("8"),
            KeyCodeValue.$("9"),
            KeyCodeValue("×", Colors.amber[100]),
          ]),
          _row([
            KeyCodeValue.$("4"),
            KeyCodeValue.$("5"),
            KeyCodeValue.$("6"),
            KeyCodeValue("-", Colors.amber[100]),
          ]),
          _row([
            KeyCodeValue.$("1"),
            KeyCodeValue.$("2"),
            KeyCodeValue.$("3"),
            KeyCodeValue("+", Colors.amber[100]),
          ]),
          Expanded(
              child: Row(
            children: [
              _keyCode(KeyCodeValue.$("0"), width: 2),
              _keyCode(KeyCodeValue.$(".")),
              _keyCode(KeyCodeValue("=", Colors.amber[100]))
            ],
          )),
        ],
      ),
    );
  }

  Widget _row(List<KeyCodeValue> keys) => Expanded(
        child: Row(
          children: keys.map((e) => _keyCode(e)).toList(),
        ),
      );

  Widget _keyCode(KeyCodeValue value, {int width = 1}) => Expanded(
        flex: width,
        child: GestureDetector(
          onTap: () {
            listner(value.value);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: value.color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              value.value,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
}

class KeyCodeValue {
  String value;
  Color color;

  KeyCodeValue(String value, Color color) {
    this.color = color;
    this.value = value;
  }

  KeyCodeValue.$(String value) {
    this.value = value;
    this.color = Colors.blue[100];
  }
}
