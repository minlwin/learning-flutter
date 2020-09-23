import 'package:flutter/material.dart';

class FormFieldWithValidator extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;
  const FormFieldWithValidator({Key key, this.fieldName, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: fieldName,
        filled: true,
        fillColor: Colors.blue[100],
      ),
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter $fieldName";
        }
        return null;
      },
    );
  }
}
