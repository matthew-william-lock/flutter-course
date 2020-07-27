// Import flutter framework
import 'package:flutter/material.dart'; // built in widgets

// First function that will be run
// void main() {
//   // Runs Application - what is the root widget?
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('Button Pressed!');
    print("Question index "+questionIndex.toString());
    questionIndex++;
  }

  var questions = [
    "What is your favourite colour?",
    "What is your favourite animal?"
  ];

  var questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My First App"),
            ),
            body: Column(
              children: <Widget>[
                Text(questions.elementAt(questionIndex)),
                RaisedButton(
                    child: Text("Answer 1"), onPressed: answerQuestion),
                RaisedButton(
                    child: Text("Answer 2"), onPressed: answerQuestion),
                RaisedButton(
                    child: Text("Answer 3"), onPressed: answerQuestion),
                RaisedButton(
                    child: Text("Answer 4"),
                    onPressed: () => print("Anon function 1")),
                RaisedButton(
                    child: Text("Answer 4"),
                    onPressed: () {
                      print("Anon function 2");
                    }),
              ],
            )));
  }
}

class NewClass {
  String name;
  int age;
  NewClass({String name = 'user', @required age}) {
    this.name = name;
    this.age = age;
  }

  // or
  // NewClass({this.name,this.age});
}
