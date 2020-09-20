import 'package:f03_dropdowns/dropdown-data.dart';
import 'package:flutter/material.dart';

class ComboBoxCustomFormField extends StatefulWidget {
  @override
  _ComboBoxCustomFormFieldState createState() =>
      _ComboBoxCustomFormFieldState();
}

class _ComboBoxCustomFormFieldState extends State<ComboBoxCustomFormField> {
  String _value;

  @override
  @override
  Widget build(BuildContext context) {
    List<String> list = DropdownData.of(context).list;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.yellow[400],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 2),
              spreadRadius: 0.5,
            ),
          ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              "Dropdown Custom Field",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: _value,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 2)),
              items: list
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Row(
                          children: [
                            Container(
                              child: Icon(Icons.account_balance_wallet),
                              margin: EdgeInsets.only(right: 16),
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
