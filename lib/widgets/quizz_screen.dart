import 'package:flutter/material.dart';
import 'package:quiz/widgets/progress_bar.dart';

class QuizzScreen extends StatefulWidget {
  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: ProgressBar(
            numberOfAnsweredQuestions: 1,
            totalNumberOfQuestions: 10,
          ),
        ),
        Text('Question'),
        Text('True'),
        Text('False'),
      ],
    );
  }
}
