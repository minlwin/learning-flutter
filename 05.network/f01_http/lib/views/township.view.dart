import 'package:f01_http/model/api/location.api.dart';
import 'package:f01_http/model/dto/division.dto.dart';
import 'package:f01_http/model/dto/township.dto.dart';
import 'package:f01_http/views/commons.dart';
import 'package:flutter/material.dart';

class TownshipView extends StatelessWidget {
  final Division division;
  const TownshipView(this.division, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(division.name),
      ),
      body: FutureBuilder(
        future: LocationApi().findById(division.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const AppError();
          }

          if (snapshot.hasData) {
            final dto = snapshot.data as DivisionWithTownships;
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(child: Text('${dto.township[index].id}')),
                title: Text(dto.township[index].name),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: dto.township.length,
            );
          }

          return const AppLoading();
        },
      ),
    );
  }
}
