import 'package:flutter/material.dart';
import 'package:studymate_app/utils/constants.dart';

class QuizLayout extends StatelessWidget {
  final Widget child;

  QuizLayout({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        color: kAppBodyColor,
        child: child,
      ),
    );
  }
}
