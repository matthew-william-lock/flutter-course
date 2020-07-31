import 'package:flutter/material.dart';

import './TextBox.dart';
import './TextControl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// Should Ideally make this stateless and make the text control state

class _MyAppState extends State<MyApp> {
  changeText() {
    setState(() {
      if (_textIndex == _textList.length - 1) {
        _textIndex = 0;
      } else {
        _textIndex++;
      }
    });
  }

  var _textList = ['Matthew', 'Jessica', 'Mark', 'Dalene'];
  var _textIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("First Assignment"),
            ),
            body: Center(
                child: Column(
              children: <Widget>[
                TextBox(text: _textList.elementAt(_textIndex)),
                TextControl(
                  text: _textList,
                  index: _textIndex,
                  buttonCallBack: changeText,
                )
              ],
            ))));
  }
}
