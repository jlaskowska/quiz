import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/widgets/home_screen.dart';
import 'package:quiz/widgets/progress_bar.dart';
import 'package:quiz/widgets/quizz_screen.dart';
import 'package:quiz/widgets/result_screen.dart';
import 'package:quiz/configs/app_colors.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.darkSlateGray,
        accentColor: AppColors.dodgerBlue,
        scaffoldBackgroundColor: AppColors.darkSlateGray,
        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      ),
      home: Scaffold(
        body: SafeArea(
          child: ResultScreen(
            numberOfCorrectAnswers: 5,
            numberOfQuestions: 10,
          ),
          // child: QuizzScreen(),
          // child: HomeScreen(),
        ),
      ),
    );
  }
}
