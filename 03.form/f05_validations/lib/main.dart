import 'package:f05_validations/validators.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  GlobalKey<FormState> _state = GlobalKey();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validation Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "User Profile",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 36,
            ),
            Form(
              key: _state,
              child: Column(
                children: [
                  TextFormField(
                    controller: _name,
                    validator: NotEmpty("User Name").validate,
                    decoration: InputDecoration(
                        labelText: "User Name",
                        hintText: "Enter User Name",
                        icon: Icon(
                          Icons.account_circle,
                        )),
                    maxLength: 20,
                  ),
                  TextFormField(
                    controller: _password,
                    validator: MinValue(fieldName: "Password", min: 6).validate,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                      icon: Icon(Icons.lock),
                    ),
                    maxLength: 8,
                    obscureText: true,
                  ),
                  TextFormField(
                    controller: _phone,
                    validator: NotEmpty("Phone Number").validate,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      hintText: "Enter Phone Number",
                      icon: Icon(Icons.phone),
                    ),
                    maxLength: 11,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 24, left: 36),
                    child: FlatButton(
                      onPressed: () {
                        if (_state.currentState.validate()) {}
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save),
                          SizedBox(width: 16),
                          Text("Save"),
                        ],
                      ),
                      color: Colors.blue[200],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
