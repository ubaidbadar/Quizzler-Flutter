import 'package:flutter/material.dart';

class QuizText extends StatelessWidget {
  final String txt;
  QuizText(this.txt);
  @override
  Widget build(BuildContext context) {
    return Text(txt, style: TextStyle(color: Colors.white, fontSize: 18));
  }
}