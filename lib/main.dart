import 'package:quizzler/quizBrain.dart';
import 'package:quizzler/quizText.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> _scoreKeeper = [];
  void questionHandler() {
    bool answer = quizBrain.getAnswer();
    bool nextQuestion = quizBrain.nextQuestion();
    setState(() {
      if (nextQuestion) {
        _scoreKeeper.add(Icon(answer ? Icons.check : Icons.close,
            color: answer ? Colors.green : Colors.red));
      } else {
        _scoreKeeper = [];
        quizBrain.reset();
        Alert(
          context: context,
          title: "Finished",
          desc: "You have reached at the end of quiz",
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Center(
              child: QuizText(quizBrain.getQuestion()),
            )),
            RaisedButton(
              child: QuizText('True'),
              color: Colors.green,
              padding: EdgeInsets.all(12),
              onPressed: questionHandler,
            ),
            SizedBox(height: 7),
            RaisedButton(
              color: Colors.red,
              child: QuizText('False'),
              onPressed: questionHandler,
              padding: EdgeInsets.all(12),
            ),
            Row(
              children: _scoreKeeper,
            )
          ],
        ));
  }
}
