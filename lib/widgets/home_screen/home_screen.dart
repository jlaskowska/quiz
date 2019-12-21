import 'package:flutter/material.dart';
import 'package:quiz/widgets/common/button.dart';
import 'package:quiz/widgets/game_screen/game_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Button(
      buttonLabel: 'Play',
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(),
        ),
      ),
    ));
  }
}
