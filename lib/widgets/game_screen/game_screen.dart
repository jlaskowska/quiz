import 'package:flutter/material.dart';
import 'package:quiz/configs/app_colors.dart';
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
  static const numberOfQuestions = 10;

  @override
  void initState() {
    super.initState();

    getQuestions();
  }

  void getQuestions() async {
    setState(() {
      isLoading = true;
    });

    questions = await QuizService().getQuestions(numberOfQuestions);

    if (questions == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Ooops!'),
          content: Text('Something went wrong.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Try again'),
              onPressed: () {
                Navigator.pop(context);
                getQuestions();
              },
            ),
          ],
          backgroundColor: AppColors.dodgerBlue,
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
    }
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
