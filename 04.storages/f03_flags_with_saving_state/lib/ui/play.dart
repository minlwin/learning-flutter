import 'dart:convert';

import 'package:f02_flags_without_saving_state/model/flag-game.dart';
import 'package:f02_flags_without_saving_state/model/question.dart';
import 'package:f02_flags_without_saving_state/ui/game-view.dart';
import 'package:f02_flags_without_saving_state/ui/result-view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef void CheckResult(Question question, String answer);
const GAME_STATE = "com.jdc.flag.game.state";

class PlayView extends StatefulWidget {
  @override
  _PlayViewState createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  Future<FlagGame> _flagGame;
  Future<SharedPreferences> _preferences = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _flagGame = _restore();
  }

  Future<FlagGame> _restore() async {
    SharedPreferences pref = await _preferences;

    // Get Json String from Share Preferences
    String string = pref.get(GAME_STATE);
    if (null != string) {
      // Decode Json to FlagGame
      return FlagGame.fromJson(jsonDecode(pref.get(GAME_STATE)));
    }

    // Generate New Game
    FlagGame newGame = FlagGame.of(10);
    // Save New Game State
    return pref
        .setString(GAME_STATE, jsonEncode(newGame.toJson()))
        .then((value) => newGame);
  }

  /*
   *  If check result game have to  save state 
   */
  _checkResult(FlagGame game, Question question, String answer) async {
    SharedPreferences pref = await _preferences;
    game.answers.add(answer);
    if (question.country == answer) {
      game.correct++;
    }
    game.current++;

    setState(() {
      if (game.current < 10) {
        // If there are some questions
        // Save Game State
        _flagGame = pref
            .setString(GAME_STATE, jsonEncode(game.toJson()))
            .then((_) => game);
      } else {
        // If theree is no question
        // Delete Game State from Share Preference
        _flagGame = pref.remove(GAME_STATE).then((value) => game);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _flagGame,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          FlagGame game = snapshot.data;
          Question question = game.next();

          CheckResult check = (q, a) => _checkResult(game, q, a);

          return null != question
              ? SingleGame(
                  title: game.title,
                  question: question,
                  checkResult: check,
                )
              : ResultView(
                  game: game,
                );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
