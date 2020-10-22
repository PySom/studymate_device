import 'package:flutter/material.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/quiz_page/quiz_page_desktop.dart';
import 'package:studymate_app/screens/test_entry/test_entry_desktop.dart';
import 'package:studymate_app/screens/video_course/video_course_desktop.dart';

class QuizPage extends StatelessWidget {
  static const String id = 'quiz_page';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: QuizDesktop(),
      ),
      mobile: OrientationLayout(
        landscape: QuizDesktop(),
      ),
    );
  }
}
