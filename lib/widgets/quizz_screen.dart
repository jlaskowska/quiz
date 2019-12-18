import 'package:flutter/material.dart';
import 'package:quiz/services/quiz_service.dart';
import 'package:quiz/widgets/progress_bar.dart';

class QuizzScreen extends StatefulWidget {
  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  @override
  void initState() {
    QuizService().getQuestions(10);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProgressBar(),
        Text('Question'),
        Text('True'),
        Text('False'),
      ],
    );
  }
}
