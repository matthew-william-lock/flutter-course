import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Question(questions.elementAt(_questionIndex)),
        Question(questions[questionIndex]['questionText']),

        // Denest the list
        ...(questions[questionIndex]['answeres'] as List<Map<String,Object>>)
            .map((answer) {
          return Answer(()=>answerQuestion(answer['score']), answer['text']);
        }).toList()

        // Answer(answerQuestion, "Question 1"),
        // Answer(answerQuestion, "Question 2"),
        // Answer(answerQuestion, "Question 3"),
        // Answer(answerQuestion, "Question 4"),

        // RaisedButton(
        //     child: Text("Answer 1"), onPressed: answerQuestion),
        // RaisedButton(
        //     child: Text("Answer 2"), onPressed: answerQuestion),
        // RaisedButton(
        //     child: Text("Answer 3"), onPressed: answerQuestion),
        // RaisedButton(
        //     child: Text("Answer 4"),
        //     onPressed: () => print("Anon function 1")),
        // RaisedButton(
        //     child: Text("Answer 4"),
        //     onPressed: () {
        //       print("Anon function 2");
        //     }),
      ],
    );
  }
}
