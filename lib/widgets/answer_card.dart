import 'package:flutter/material.dart';
import 'package:quiz/configs/app_colors.dart';

class AnswerCard extends StatelessWidget {
  final String titleLabel;

  AnswerCard(this.titleLabel);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 5, color: AppColors.darkSlateGrayBorder),
      ),
      child: ListTile(
        leading: Text(
          titleLabel,
          style: TextStyle(fontSize: 20),
        ),
        trailing: Icon(
          Icons.check_circle,
          color: AppColors.dodgerBlue,
          size: 30,
        ),
        onTap: () {},
      ),
    );
  }
}
