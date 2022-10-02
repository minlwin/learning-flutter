import 'package:f01_http/model/api/location.api.dart';
import 'package:f01_http/model/dto/division.dto.dart';
import 'package:f01_http/views/commons.dart';
import 'package:f01_http/views/township.view.dart';
import 'package:flutter/material.dart';

class DivisionView extends StatelessWidget {
  const DivisionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.pin_drop),
        title: const Text("Divisions"),
      ),
      body: FutureBuilder(
        future: LocationApi().divisions(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const AppError();
          }

          if (snapshot.hasData) {
            final list = snapshot.data as List<Division>;
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) => DivisionListItem(list[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: list.length,
            );
          }

          return const AppLoading();
        },
      ),
    );
  }
}

class DivisionListItem extends StatelessWidget {
  final Division data;
  const DivisionListItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(data.region.toUpperCase().substring(0, 2)),
      ),
      title: Text(data.name),
      subtitle: Text(data.capital),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TownshipView(data)));
      },
    );
  }
}
