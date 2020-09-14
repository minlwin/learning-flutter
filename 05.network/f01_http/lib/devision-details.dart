import 'package:f01_http/api/dto/division.dart';
import 'package:f01_http/api/location-api.dart';
import 'package:flutter/material.dart';

class DivisionDetails extends StatefulWidget {
  @override
  _DivisionDetailsState createState() => _DivisionDetailsState();
}

class _DivisionDetailsState extends State<DivisionDetails> {
  Future<DivisionWithTownship> division;
  LocationApi _api;

  @override
  void initState() {
    super.initState();
    _api = LocationApi();
  }

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments;
    division = _api.divisionWithTownships(id);

    return FutureBuilder(
      future: division,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Api Error"),
            ),
          );
        }

        if (snapshot.hasData) {
          return _view(snapshot.data);
        }

        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  _view(DivisionWithTownship div) => Scaffold(
        appBar: AppBar(
          title: Text(div.division.name),
          centerTitle: false,
        ),
        body: ListView.builder(
          itemCount: div.townships.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(div.townships[index].id.toString()),
                ),
                title: Text(div.townships[index].name),
              ),
            );
          },
        ),
      );
}
