///Appreciation.
///This applications concept was wholly gotten from FilledStack on YouTube - https://www.youtube.com/watch?v=z7P1OFLw4kY.
///We are grateful that you shared your knowledge.
///Thank you so much

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studymate_app/providers/provider_list.dart';
import 'package:studymate_app/screens/auth/login_screen.dart';
import 'package:studymate_app/screens/auth/register_screen.dart';
import 'package:studymate_app/screens/choose_profile/choose_profile.dart';
import 'package:studymate_app/screens/course/course.dart';
import 'package:studymate_app/screens/home/home_page.dart';
import 'package:studymate_app/screens/my_course/my_course.dart';
import 'package:studymate_app/screens/profile/profile.dart';
import 'package:studymate_app/screens/quiz_page/quiz_page.dart';
import 'package:studymate_app/screens/recent_courses/recent_courses.dart';
import 'package:studymate_app/screens/study_pack/study_pack.dart';
import 'package:studymate_app/screens/test_done/test_done.dart';
import 'package:studymate_app/screens/test_entry/test_entry.dart';
import 'package:studymate_app/screens/video_course/video_course.dart';
import 'package:studymate_app/utils/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        title: 'StudyMATE',
        debugShowCheckedModeBanner: false,
        initialRoute: Register.id,
        theme: myThemeData(context),
        routes: {
          Register.id: (context) => Register(),
          Login.id: (context) => Login(),
          HomePage.id: (context) => HomePage(),
          CoursePage.id: (context) => CoursePage(),
          RecentCoursePage.id: (context) => RecentCoursePage(),
          ProfilePage.id: (context) => ProfilePage(),
          MyCoursePage.id: (context) => MyCoursePage(),
          VideoCoursePage.id: (context) => VideoCoursePage(),
          StudyPackPage.id: (context) => StudyPackPage(),
          TestEntryPage.id: (context) => TestEntryPage(),
          QuizPage.id: (context) => QuizPage(),
          TestDonePage.id: (context) => TestDonePage(),
          ChooseProfilePage.id: (context) => ChooseProfilePage(),
        },
      ),
    );
  }
}
