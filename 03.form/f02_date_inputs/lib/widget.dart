import 'package:flutter/material.dart';

class DateInputField extends StatelessWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const DateInputField._({
    Key key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  factory DateInputField.create({Key key}) {
    return DateInputField._(
      key: key,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputDatePickerFormField(
            firstDate: firstDate,
            lastDate: lastDate,
            initialDate: initialDate,
            fieldLabelText: "Date Input",
          ),
        ),
        GestureDetector(
          onTap: () {
            showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: firstDate,
                lastDate: lastDate);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.event),
          ),
        ),
      ],
    );
  }
}
