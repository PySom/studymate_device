import 'package:flutter/material.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/study_pack/study_pack_desktop.dart';

class StudyPackPage extends StatelessWidget {
  static const String id = 'study_pack_page';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: StudyPackDesktop(),
      ),
      mobile: OrientationLayout(
        landscape: StudyPackDesktop(),
      ),
    );
  }
}
