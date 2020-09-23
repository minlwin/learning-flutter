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

class ConfirmToDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirm"),
      content: Text("Do you want to delete this product!"),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text("Yes"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text("No"),
        ),
      ],
    );
  }
}
