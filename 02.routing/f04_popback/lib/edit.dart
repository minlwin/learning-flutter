import 'package:flutter/material.dart';

class EditView extends StatefulWidget {
  @override
  _EditViewState createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController _message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Message"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formState.currentState.validate()) {
            Navigator.pop(context, _message.text);
          }
        },
        child: Icon(Icons.save),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Message",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Form(
              key: _formState,
              child: TextFormField(
                controller: _message,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter Message";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Message"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
