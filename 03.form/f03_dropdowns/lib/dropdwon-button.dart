import 'package:f03_dropdowns/dropdown-data.dart';
import 'package:flutter/material.dart';

class ComboBoxButton extends StatefulWidget {
  @override
  _ComboBoxButtonState createState() => _ComboBoxButtonState();
}

class _ComboBoxButtonState extends State<ComboBoxButton> {
  String _value;

  @override
  @override
  Widget build(BuildContext context) {
    List<String> list = DropdownData.of(context).list;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 2),
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              "Dropdown Button",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: DropdownButton<String>(
              isExpanded: true,
              value: _value,
              items: list
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Icon(Icons.arrow_forward),
                            ),
                            Text(e),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Select : ${_value ?? ""}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue[900],
              ),
            ),
          )
        ],
      ),
    );
  }
}
