import 'package:flutter/material.dart';
import 'package:quiz_app/model/dummy.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/view_ext.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestion = questions[0];
  var currentnumber = 0;
  final List<String> answered = [];
  var correctAnswer = 0;

  void setClick() {
    setState(() {
      currentnumber++;
      currentQuestion = questions[currentnumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            ...currentQuestion.getShuffledAnswers().map((data) {
              return ButtonRounded(() {
                answered.add(data);
                if (data == currentQuestion.answers[0]) {
                  correctAnswer++;
                }

                if (currentnumber == questions.length - 1) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                answered: answered,
                                correctAnswer: correctAnswer,
                              )));
                  return;
                }
                setClick();
              }, data);
            })
          ],
        ),
      ),
    );
  }
}
