import 'package:flutter/material.dart';
import 'package:quiz_app/model/dummy.dart';
import 'package:quiz_app/view_ext.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({key, this.answered, this.correctAnswer});

  final List<String> answered;
  final int correctAnswer;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered ${widget.correctAnswer} out of ${questions.length} questions correctly !',
              style: TextStyle(color: Colors.white70, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.only(top: 24),
              height: 300,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 14.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            margin: EdgeInsets.only(right: 12),
                            color: widget.answered[index] ==
                                    questions[index].answers[0]
                                ? Colors.cyan[200]
                                : Colors.red[200],
                            shape: CircleBorder(),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                (index + 1).toString(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  questions[index].question,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  widget.answered[index],
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  'correct: ${questions[index].answers[0]}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.lightBlue[300]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 16,
            ),
            ButtonRounded(() {
              Navigator.pop(context);
            }, 'Back To Start'),
          ],
        ),
      ),
    );
  }
}
