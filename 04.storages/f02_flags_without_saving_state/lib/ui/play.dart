import 'package:f02_flags_without_saving_state/model/flag-game.dart';
import 'package:f02_flags_without_saving_state/model/flags-repo.dart';
import 'package:f02_flags_without_saving_state/ui/game-view.dart';
import 'package:f02_flags_without_saving_state/ui/result-view.dart';
import 'package:flutter/material.dart';

typedef void CheckResult(Question question, String answer);

class PlayView extends StatefulWidget {
  @override
  _PlayViewState createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  FlagGame _game;

  @override
  void initState() {
    super.initState();
    _game = FlagGame.of(10);
  }

  @override
  Widget build(BuildContext context) {
    Question question = _game.next();
    return null != question
        ? WillPopScope(
            onWillPop: () {
              return _confirm(context);
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text("The Flag"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _game.title,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              body: GameView(
                question: question,
                checkResult: _check,
              ),
            ),
          )
        : ResultView(
            game: _game,
          );
  }

  _check(Question question, String answer) {
    setState(() {
      _game.answers.add(answer);
      if (question.country == answer) {
        _game.correct++;
      }
    });
  }

  Future<bool> _confirm(BuildContext context) async {
    bool result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Really?"),
        content:
            Text("Your are in good mood. Do you really want to end this game?"),
        actions: [
          RaisedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Yes, anyway"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: RaisedButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("No, I will try"),
            ),
          )
        ],
      ),
    );
    return result ?? false;
  }
}

class SummaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
