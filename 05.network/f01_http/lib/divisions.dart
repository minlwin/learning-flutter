import 'package:f01_http/api/dto/division.dart';
import 'package:f01_http/api/location-api.dart';
import 'package:flutter/material.dart';

class Divisions extends StatefulWidget {
  @override
  _DivisionsState createState() => _DivisionsState();
}

class _DivisionsState extends State<Divisions> {
  Future<dynamic> divisions;
  LocationApi _api = LocationApi();

  @override
  void initState() {
    super.initState();
    divisions = _api.divisions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch API"),
      ),
      body: FutureBuilder(
        future: divisions,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Division> list = snapshot.data;
            return _divisions(list);
          }

          if (snapshot.hasError) {
            return Scaffold(body: Center(child: Text("${snapshot.error}")));
          }
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  _divisions(List<Division> list) => ListView.builder(
        itemBuilder: (_, i) => Card(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/details", arguments: list[i].id);
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Text(list[i].id.toString()),
              ),
              title: Text(list[i].name),
              subtitle: Text(list[i].capital),
            ),
          ),
        ),
        itemCount: list.length,
      );
}
