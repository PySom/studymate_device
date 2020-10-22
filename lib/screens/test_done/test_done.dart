import 'package:flutter/material.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/test_done/test_done_desktop.dart';
import 'package:studymate_app/screens/test_entry/test_entry_desktop.dart';
import 'package:studymate_app/screens/video_course/video_course_desktop.dart';

class TestDonePage extends StatelessWidget {
  static const String id = 'test_done_page';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: TestDoneDesktop(),
      ),
      mobile: OrientationLayout(
        landscape: TestDoneDesktop(),
      ),
    );
  }
}
