import 'package:f02_flags_without_saving_state/model/flags-repo.dart';
import 'package:f02_flags_without_saving_state/ui/play.dart';
import 'package:flutter/material.dart';

class GameView extends StatelessWidget {
  final Question question;
  final CheckResult checkResult;

  const GameView({Key key, @required this.question, this.checkResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(36),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Select One!",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            width: double.infinity,
            height: 240,
            child: Center(
              child: Image.asset(
                question.flag.image,
              ),
            ),
          ),
          _buttons(question.questions)
        ],
      ),
    );
  }

  _buttons(List<String> list) => Column(
        children: [
          Row(children: [
            _button(list[0]),
            SizedBox(
              width: 8,
            ),
            _button(list[1]),
          ]),
          Row(children: [
            _button(list[2]),
            SizedBox(
              width: 8,
            ),
            _button(list[3]),
          ]),
        ],
      );

  _button(String string) => Expanded(
        flex: 1,
        child: RawMaterialButton(
          onPressed: () {
            checkResult?.call(question, string);
          },
          child: Text(string),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.purple,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
}
