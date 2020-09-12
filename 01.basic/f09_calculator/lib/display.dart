import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String tempStr;
  final String resultStr;

  const Display({Key key, this.tempStr, this.resultStr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20, right: 20, left: 20),
      child: Column(
        children: [_temp(), _result()],
      ),
    );
  }

  _temp() => Expanded(
        child: Container(
          alignment: Alignment.bottomRight,
          child: Text(
            tempStr,
          ),
        ),
      );

  _result() => Container(
        alignment: Alignment.bottomRight,
        child: Text(
          resultStr,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 56,
            fontFamily: "Arial",
          ),
        ),
      );
}
