import 'package:flutter/material.dart';
import 'package:quiz/configs/app_colors.dart';
import 'package:quiz/widgets/game_screen/base_card.dart';

class AnswerCard extends StatelessWidget {
  final bool isSelected;
  final Function onTap;
  final String titleLabel;

  const AnswerCard({
    @required this.titleLabel,
    @required this.isSelected,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      titleLabel: titleLabel,
      borderColor: AppColors.darkSlateGrayBorder,
      icon: Icons.check_circle,
      iconColor: isSelected ? AppColors.dodgerBlue : AppColors.darkSlateBlue,
      onTap: onTap,
    );
  }
}
