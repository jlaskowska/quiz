import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/common/button.dart';
import 'package:quiz/widgets/game_screen/answer_card.dart';
import 'package:quiz/widgets/game_screen/progress_bar.dart';
import 'package:quiz/widgets/game_screen/result_card.dart';
import 'package:quiz/widgets/result_screen/result_screen.dart';

class Quiz extends StatefulWidget {
  final List<Question> questions;

  Quiz({@required this.questions});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  static const delayDuration = 2;

  int questionIndex = 0;
  String questionText;
  int numberOfCorrectAnswers = 0;
  String selectedAnswer;
  bool isDelayActive = false;
  bool isTrueCorrectAnswer;

  int get numberOfQuestions => widget.questions.length;

  @override
  void initState() {
    super.initState();

    questionText = widget.questions[questionIndex].question;
  }

  void updateQuiz() async {
    if (selectedAnswer == null) {
      return;
    }

    String correctAnswer = widget.questions[questionIndex].correctAnswer;
    isTrueCorrectAnswer = correctAnswer.toLowerCase() == 'true';

    bool isPlayerCorrect = selectedAnswer == correctAnswer.toLowerCase();
    if (isPlayerCorrect) {
      numberOfCorrectAnswers++;
    }

    setState(() {
      isDelayActive = true;
      questionIndex++;
    });

    await Future.delayed(Duration(seconds: delayDuration));

    if (questionIndex < widget.questions.length) {
      setState(() {
        questionText = widget.questions[questionIndex].question;
        selectedAnswer = null;
        isDelayActive = false;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            numberOfCorrectAnswers: numberOfCorrectAnswers,
            numberOfQuestions: numberOfQuestions,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: ProgressBar(
                  numberOfAnsweredQuestions: questionIndex,
                  totalNumberOfQuestions: numberOfQuestions,
                ),
              ),
              Text(
                questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Column(
                children: <Widget>[
                  isDelayActive
                      ? ResultCard(
                          titleLabel: 'True',
                          isCorrect: isTrueCorrectAnswer,
                        )
                      : AnswerCard(
                          titleLabel: 'True',
                          isSelected: selectedAnswer == 'true',
                          onTap: () => setSelectedAnswer('true'),
                        ),
                  SizedBox(
                    height: 24,
                  ),
                  isDelayActive
                      ? ResultCard(
                          titleLabel: 'False',
                          isCorrect: !isTrueCorrectAnswer,
                        )
                      : AnswerCard(
                          titleLabel: 'False',
                          isSelected: selectedAnswer == 'false',
                          onTap: () => setSelectedAnswer('false'),
                        ),
                ],
              ),
              Center(
                child: Button(
                  buttonLabel: 'Next',
                  onPressed: selectedAnswer != null && !isDelayActive ? updateQuiz : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setSelectedAnswer(String text) {
    setState(() {
      selectedAnswer = text;
    });
  }
}
