import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int numberOfQuestions;
  final int numberOfCorrectAnswers;

  ResultScreen({@required this.numberOfCorrectAnswers, @required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 15,
          child: Column(
            children: <Widget>[Text('Congratulations!')],
          ),
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              child: Text('Main Menu'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Play Again'),
              onPressed: null,
            ),
          ],
        ),
      ],
    );
  }
}
