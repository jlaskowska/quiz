import 'package:flutter/material.dart';
import 'package:quiz/configs/app_colors.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 5, color: AppColors.darkSlateBlue),
          ),
        ),
        Container(
          child: FittedBox(
            child: Text('Number of correct Answers'),
          ),
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border(
                top: BorderSide(width: 5, color: AppColors.darkSlateBlue),
                bottom: BorderSide(width: 5, color: AppColors.darkSlateBlue),
                left: BorderSide(width: 5, color: AppColors.darkSlateBlue),
              ),
              gradient: LinearGradient(
                colors: [AppColors.progressGradientStart, AppColors.progressGradientEnd],
              )),
        )
      ],
    );
  }
}
