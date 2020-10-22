import 'package:flutter/material.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/video_course/video_course_desktop.dart';

class VideoCoursePage extends StatelessWidget {
  static const String id = 'video_course_page';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: VideoCourseDesktop(),
      ),
      mobile: OrientationLayout(
        landscape: VideoCourseDesktop(),
      ),
    );
  }
}
