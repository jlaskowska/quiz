import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/widgets/home_screen.dart';
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
      ),
      home: Scaffold(
        backgroundColor: Color(0xff252c4a),
        // backgroundColor:Theme.of(context).primaryColor,
        body: SafeArea(
          child: ResultScreen(),
          // child: HomeScreen(),
        ),
      ),
    );
  }
}
