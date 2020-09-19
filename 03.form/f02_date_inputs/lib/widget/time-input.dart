import 'package:flutter/material.dart';

class TimeInputField extends StatefulWidget {
  @override
  _TimeInputFieldState createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  TextEditingController _value = TextEditingController();

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
          onTap: _setTime,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.schedule),
          ),
        ),
      ],
    );
  }

  _setTime() async {
    TimeOfDay time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (null != time) {
      setState(() {
        _value.text = time.format(context);
      });
    }
  }
}
