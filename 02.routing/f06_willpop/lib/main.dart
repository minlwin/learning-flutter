import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          title: Column(
            children: [
              Text("Will Pop Scope"),
              Text("Pop Back"),
            ],
          ),
        ),
        body: FirstView(),
      ),
    );
  }
}

class FirstView extends StatefulWidget {
  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: _openNext,
            child: Text("Next"),
          ),
          Text(_result)
        ],
      ),
    );
  }

  _openNext() async {
    dynamic result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextView(),
      ),
    );

    setState(() {
      _result = result ?? "From Back Arrow";
    });
  }
}

class NextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onBackPress(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Next View"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context, "By Button");
            },
            child: Text("Back"),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPress(BuildContext context) async {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              "Are you sure?",
              style: Theme.of(context).textTheme.headline4,
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("Yes"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text("No"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
