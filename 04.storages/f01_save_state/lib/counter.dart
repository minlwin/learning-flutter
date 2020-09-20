import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const COUNT = "count";

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  Future<int> _counter;

  @override
  initState() {
    super.initState();
    _counter = _pref.then((pref) => pref.get(COUNT) ?? 0);
  }

  _changeState({bool up = true}) async {
    final SharedPreferences pref = await _pref;
    int count = pref.get(COUNT) ?? 0;

    count = up ? count + 1 : count - 1;

    setState(() {
      _counter = pref.setInt(COUNT, count).then((success) {
        print("Success : $success");
        return count;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.symmetric(vertical: 24),
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: FutureBuilder(
            future: _counter,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  "${snapshot.data}",
                  style: Theme.of(context).textTheme.headline1,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text("Up"),
                    ],
                  ),
                  onPressed: () {
                    _changeState();
                  },
                ),
              ),
              Container(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove),
                      Text("Down"),
                    ],
                  ),
                  onPressed: () {
                    _changeState(up: false);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
