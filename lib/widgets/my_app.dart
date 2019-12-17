import 'package:flutter/material.dart';
import 'package:quiz/widgets/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
