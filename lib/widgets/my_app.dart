import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/configs/app_colors.dart';
import 'package:quiz/widgets/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.darkSlateGray,
        accentColor: AppColors.dodgerBlue,
        scaffoldBackgroundColor: AppColors.darkSlateGray,
        fontFamily: GoogleFonts.oxygen().fontFamily,
      ),
      home: Scaffold(
        body: SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
