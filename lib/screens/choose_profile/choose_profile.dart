import 'package:flutter/material.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/choose_profile/choose_profile_desktop.dart';
import 'package:studymate_app/screens/course/course_desktop_portrait.dart';
import '../home/home_mobile_portrait.dart';

class ChooseProfilePage extends StatelessWidget {
  static const String id = 'choose_profile_page';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: ChooseProfileDesktop(),
      ),
      mobile: OrientationLayout(
        landscape: ChooseProfileDesktop(),
      ),
    );
  }
}
