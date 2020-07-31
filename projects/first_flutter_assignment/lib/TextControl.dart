import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final List<String> text;
  final int index;
  final Function buttonCallBack;

  TextControl(
      {@required this.text,
      @required this.index,
      @required this.buttonCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: RaisedButton(
        child: Text(text.elementAt(index)),
        onPressed: buttonCallBack,
      ),
    );
  }
}
