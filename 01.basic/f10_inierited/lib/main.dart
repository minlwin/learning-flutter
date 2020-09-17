import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppContext(
        child: MyList(),
      ),
    );
  }
}

class AppContext extends InheritedWidget {
  final List<String> list = [];

  AppContext({Key key, @required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppContext oldWidget) => true;

  static AppContext of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppContext>();
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  GlobalKey<FormState> _formState = GlobalKey();
  TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> list = AppContext.of(context).list;
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited Widget"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(list[index]),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Form(
                key: _formState,
                child: AlertDialog(
                  title: Text("Message"),
                  content: TextFormField(
                    controller: _message,
                    decoration: InputDecoration(
                      labelText: "Enter Message",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter message";
                      }
                      return null;
                    },
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: RaisedButton(
                        onPressed: _save,
                        child: Text("Add"),
                      ),
                    )
                  ],
                )),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _save() {
    if (_formState.currentState.validate()) {
      setState(() {
        AppContext.of(context).list.add(_message.text);
        _message.clear();
        Navigator.pop(context);
      });
    }
  }
}
