import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangeInputFields extends StatefulWidget {
  @override
  _DateRangeInputFieldsState createState() => _DateRangeInputFieldsState();
}

class _DateRangeInputFieldsState extends State<DateRangeInputFields> {
  TextEditingController _value = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            enabled: false,
            controller: _value,
          ),
        ),
        GestureDetector(
          onTap: _setDate,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.event),
          ),
        ),
      ],
    );
  }

  _setDate() async {
    DateTimeRange range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );

    if (null != range) {
      setState(() {
        _value.text =
            "${_dateFormat.format(range.start)} to ${_dateFormat.format(range.end)}";
      });
    }
  }
}
