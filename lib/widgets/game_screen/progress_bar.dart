import 'package:flutter/material.dart';
import 'package:quiz/configs/app_colors.dart';

class ProgressBar extends StatelessWidget {
  static const _totalHeight = 50.0;
  static const _circularBorderRadius = 40.0;
  static const _borderWidth = 5.0;
  static const _fillContainerMargin = 5.0;

  final double width;
  final int numberOfAnsweredQuestions;
  final int totalNumberOfQuestions;

  const ProgressBar({
    this.width = 300,
    @required this.numberOfAnsweredQuestions,
    @required this.totalNumberOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final outlineContainerHeight = _totalHeight;
    final outlineContainerWidth = width;
    final fillContainerHeight = outlineContainerHeight - 2 * _fillContainerMargin;
    final totalFillContainerWidth = outlineContainerWidth - 2 * _fillContainerMargin;
    final fillContainerWidth = totalFillContainerWidth * (numberOfAnsweredQuestions / totalNumberOfQuestions);

    return Stack(
      children: <Widget>[
        Container(
          height: fillContainerHeight,
          width: fillContainerWidth,
          margin: EdgeInsets.all(_fillContainerMargin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_circularBorderRadius),
            gradient: LinearGradient(
              colors: [
                AppColors.tomato,
                AppColors.purple,
              ],
            ),
          ),
        ),
        Container(
          height: outlineContainerHeight,
          width: outlineContainerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_circularBorderRadius),
            border: Border.all(
              width: _borderWidth,
              color: AppColors.darkSlateBlue,
            ),
          ),
        ),
        Container(
          height: outlineContainerHeight,
          width: outlineContainerWidth,
          child: Center(
            child: Text('$numberOfAnsweredQuestions/$totalNumberOfQuestions'),
          ),
        ),
      ],
    );
  }
}
