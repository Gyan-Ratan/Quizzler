import 'package:flutter/material.dart';
import 'package:quiz_app/question_bank01.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final ButtonStyle flatButtonStyleGreen = TextButton.styleFrom(
    foregroundColor: Colors.green,
    side: BorderSide(
      width: 5.0,
      color: Colors.green,
      style: BorderStyle.solid,
    ),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
  );
  final ButtonStyle flatButtonStyleRed = TextButton.styleFrom(
    foregroundColor: Colors.red,
    side: BorderSide(
      width: 5.0,
      color: Colors.red,
      style: BorderStyle.solid,
    ),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
  );
  QuestionBank1 questionBank = new QuestionBank1();
  List<Icon> scoreboard = [];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // List<bool> answers = [false, true, true];

  void checkAnswers(bool userPickedAnswer) {
    bool CorrectAnswer = questionBank.getAnswer();
    setState(() {
      if (questionBank.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        questionBank.reset();
        scoreboard = [];
      } else {
        if (CorrectAnswer == userPickedAnswer) {
          scoreboard.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreboard.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        questionBank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: OutlinedButton(
              style: flatButtonStyleGreen,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswers(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: OutlinedButton(
              style: flatButtonStyleRed,
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  checkAnswers(false);
                  questionBank.nextQuestion();
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreboard,
        )
      ],
    );
  }
}
