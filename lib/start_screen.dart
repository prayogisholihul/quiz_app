import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/view_ext.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<StartScreen> {
  final String image = 'assets/images/quiz-logo.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 300,
            ),
            SizedBox(
              height: 45,
            ),
            StyledText('Learn Flutter the fun way!', Colors.white),
            SizedBox(
              height: 12,
            ),
            ButtonRounded(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => QuizScreen()));
            }, 'Start Quiz')
          ],
        ),
      ),
    );
  }
}
