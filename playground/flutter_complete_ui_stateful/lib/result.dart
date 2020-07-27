import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function restart;

  String get resultPhrase {
    var resultText = "Your score is " + score.toString() + " !";
    return resultText;
  }

  Result({@required this.score, @required this.restart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: restart,
          )
        ],
      ),
    );
  }
}
