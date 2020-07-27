// Import flutter framework
import 'package:flutter/material.dart'; // built in widgets

// Import widgets
import './quiz.dart';
import './result.dart';

// First function that will be run
// void main() {
//   // Runs Application - what is the root widget?
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// Need seperate class for stateful widgets - generic type
class _MyAppState extends State<MyApp> {
  // underscore creates a private class
  var _questionIndex = 0;
  var _totalScore = 0;

  void restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    print('Button Pressed!');
    print("Question index " + _questionIndex.toString());
    setState(() {
      //Will call the build function again
      _questionIndex++;
      _totalScore = _totalScore + score;
    });
  }

  static const questions = [
    // Map
    {
      "questionText": "What is your favourite colour?",
      "answeres": [
        {'text': "Black", "score": 5},
        {'text': "Red", "score": 2},
        {'text': "Green", "score": 3},
      ]
    },
    {
      "questionText": "What is your favourite animal?",
      "answeres": [
        {'text': "Rabbit", "score": 5},
        {'text': "Snake", "score": 2},
        {'text': "Lion", "score": 3},
      ]
    },
    {
      "questionText": "Who is your favourite person?",
      "answeres": [
        {'text': "Matt", "score": 5},
        {'text': "Matt", "score": 2},
        {'text': "Matt", "score": 3},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My First App"),
            ),
            body: _questionIndex < questions.length
                ? Quiz(
                    answerQuestion: answerQuestion,
                    questionIndex: _questionIndex,
                    questions: questions,
                  )
                : Result(
                    score: _totalScore,
                    restart: restartQuiz,
                  )));
  }
}
