import 'package:flutter/material.dart';
import 'package:quiz/widgets/game_screen/quiz.dart';

import '../../models/question.dart';
import '../../services/quiz_service.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isLoading;
  List<Question> questions;
  static const numberOfQuestions = 1;

  @override
  void initState() {
    getQuestions();
  }

  void getQuestions() async {
    setState(() {
      isLoading = true;
    });

    questions = await QuizService().getQuestions(numberOfQuestions);
    print(questions);
    //TODO questions could be null

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Quiz(
                questions: questions,
              ),
      ),
    );
  }
}
