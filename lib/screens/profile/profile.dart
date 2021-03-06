import 'package:flutter/material.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/profile/profile_desktop.dart';
import 'package:studymate_app/screens/recent_courses/recent_courses_desktop.dart';
import '../home/home_mobile_portrait.dart';

class ProfilePage extends StatelessWidget {
  static const String id = 'profile_page';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: ProfileDesktop(),
      ),
      mobile: OrientationLayout(
        landscape: ProfileDesktop(),
      ),
    );
  }
}
