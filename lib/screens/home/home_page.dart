import 'dart:math';

import 'package:flutter/material.dart';
import 'package:studymate_app/responsive/orientation_layout.dart';
import 'package:studymate_app/responsive/screen_layout_type.dart';
import 'package:studymate_app/screens/recent_courses/recent_courses_desktop.dart';
import '../home/home_mobile_portrait.dart';

import 'home_desktop_landscape.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutType(
      desktop: OrientationLayout(
        landscape: HomeDesktopLandscape(),
      ),
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(),
        landscape: HomeDesktopLandscape(),
      ),
    );
  }
}
