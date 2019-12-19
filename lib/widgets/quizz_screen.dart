import 'package:flutter/material.dart';
import 'package:quiz/configs/app_colors.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/services/quiz_service.dart';
import 'package:quiz/widgets/answer_card.dart';
import 'package:quiz/widgets/button.dart';
import 'package:quiz/widgets/progress_bar.dart';
import 'package:quiz/widgets/result_screen.dart';

class QuizzScreen extends StatefulWidget {
  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  int questionIndex;
  String questionText;
  List<Question> questions = [];
  int numberOfCorrectAnswers = 0;
  int numberOfQuestions = 10;
  String selectedAnswer;

  @override
  void initState() {
    questionIndex = 0;
    questionText = '';
    getQuestions();
  }

  void getQuestions() async {
    try {
      questions = await QuizService().getQuestions(numberOfQuestions);
      print(questions);

      setState(() {
        questionText = questions[questionIndex].question;
      });
    } catch (error) {
      print('An error occured: $error');
    }
  }

  void getCorrectAnswer() {
    // if correcctAnswer == true, dann numberOfCorrectAnswers ++
    // if correctAswers != true, dann numberOfCorrectAnswers++
  }

  void updateQuiz() {
    if (selectedAnswer == null) {
      return;
    }

    String correctAnswer = questions[questionIndex].correctAnswer;
    print('correctAnswer: $correctAnswer');
    print('selectedAnswer: $selectedAnswer');
    if (selectedAnswer == correctAnswer.toLowerCase()) {
      numberOfCorrectAnswers++;
    }
    print('numberOfCorrectAnswers: $numberOfCorrectAnswers');

    if (++questionIndex < questions.length) {
      setState(() {
        questionText = questions[questionIndex].question;
        selectedAnswer = null;
      });
    } else
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: ProgressBar(
              numberOfAnsweredQuestions: questionIndex,
              totalNumberOfQuestions: 10,
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
          AnswerCard(
            titleLabel: 'True',
            isSelected: selectedAnswer == 'true',
            onTap: () => setSelectedAnswer('true'),
          ),
          AnswerCard(
            titleLabel: 'False',
            isSelected: selectedAnswer == 'false',
            onTap: () => setSelectedAnswer('false'),
          ),
          Center(
            child: Button(
              buttonLabel: 'Next',
              onPressed: selectedAnswer != null ? updateQuiz : null,
            ),
          )
        ],
      ),
    );
  }

  void setSelectedAnswer(String text) {
    print('here');
    setState(() {
      selectedAnswer = text;
    });
  }
}
