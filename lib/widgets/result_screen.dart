import 'package:flutter/material.dart';
import 'package:quiz/configs/app_colors.dart';
import 'package:quiz/widgets/button.dart';

class ResultScreen extends StatelessWidget {
  final int numberOfQuestions;
  final int numberOfCorrectAnswers;

  ResultScreen({@required this.numberOfCorrectAnswers, @required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Card(
            margin: EdgeInsets.all(20),
            color: AppColors.resultCardBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Congratulations!',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                Text(
                  'Your Score $numberOfCorrectAnswers / $numberOfQuestions',
                  style: Theme.of(context).textTheme.subhead,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(buttonLabel: 'Main Menu', onPressed: () {}),
              Button(buttonLabel: 'Play Again', onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
