import 'package:flutter/material.dart';
import 'package:quiz/configs/app_colors.dart';

class AnswerCard extends StatelessWidget {
  final bool isSelected;
  final Function onTap;
  final String titleLabel;

  AnswerCard({
    @required this.titleLabel,
    @required this.isSelected,
    @required this.onTap,
  });

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
          color: isSelected ? AppColors.dodgerBlue : AppColors.darkSlateBlue,
          size: 30,
        ),
        onTap: onTap,
      ),
    );
  }
}
