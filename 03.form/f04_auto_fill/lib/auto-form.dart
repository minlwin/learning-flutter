import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class AutoForm extends StatefulWidget {
  @override
  _AutoFormState createState() => _AutoFormState();
}

class _AutoFormState extends State<AutoForm> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  List<String> suggestions = [
    "Flutter",
    "Dart",
    "Android",
    "iOS",
    "Web",
    "Desktop"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Text(
            "Auto Complete Text Field",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 16,
          ),
          SimpleAutoCompleteTextField(
            key: key,
            suggestions: suggestions,
            clearOnSubmit: true,
            decoration: InputDecoration(
              labelText: "Enter One",
              hintText: "Auto Complete Text Field",
              filled: true,
              fillColor: Colors.blue[200],
            ),
            textSubmitted: (data) {
              setState(() {
                added.add(data);
              });
            },
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: added.length,
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    added[index],
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
