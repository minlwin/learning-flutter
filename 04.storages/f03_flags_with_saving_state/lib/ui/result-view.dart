import 'package:f02_flags_without_saving_state/model/flag-game.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final FlagGame game;

  const ResultView({Key key, @required this.game}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.grade),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              game.result,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: game.questions.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
                leading: SizedBox(
                  width: 48,
                  child: Image.asset(game.questions[index].flag.image),
                ),
                title: Text(game.questions[index].country),
                subtitle: Text(game.answers[index]),
                trailing: Icon(
                    game.questions[index].country == game.answers[index]
                        ? Icons.done
                        : Icons.clear)),
          ),
        ),
      ),
    );
  }
}
