import 'package:flutter/material.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/course/course_desktop_portrait.dart';
import '../home/home_mobile_portrait.dart';

class CoursePage extends StatelessWidget {
  static const String id = 'course_page';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: CourseDesktopLandscape(),
      ),
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(),
        landscape: CourseDesktopLandscape(),
      ),
    );
  }
}
