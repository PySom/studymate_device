import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studymate_app/screens/course/course_desktop_portrait.dart';
import 'package:studymate_app/screens/home/home_desktop_landscape.dart';
import 'package:studymate_app/screens/recent_courses/recent_courses_desktop.dart';
import 'package:studymate_app/screens/study_pack/study_pack.dart';
import 'package:studymate_app/screens/test_entry/test_entry.dart';
import 'package:studymate_app/screens/video_course/video_course.dart';
import 'package:studymate_app/utils/constants.dart';

import '../layout.dart';

class MyCourseDesktop extends StatefulWidget {
  @override
  _MyCourseDesktopState createState() => _MyCourseDesktopState();
}

class _MyCourseDesktopState extends State<MyCourseDesktop> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Layout(
      isScrollable: true,
      onTap: () {
        scrollController.animateTo(0.0,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseHeader(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'My Courses',
              style: kAppHeaderText,
            ),
          ),
          ProgressNotification(
            progressWidth: 0.5,
            point: 1000,
            myPoint: 400,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 139,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TransCourseBox(
                          isActive: true,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TransCourseBox(
                          isActive: false,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TransCourseBox(
                          isActive: false,
                        ),
                        SizedBox(
                          height: 38,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PackDisplay(),
                        SizedBox(
                          height: 20,
                        ),
                        PackDisplay(),
                        SizedBox(
                          height: 20,
                        ),
                        PackDisplay(),
                        SizedBox(
                          height: 20,
                        ),
                        StudyPackDisplay(),
                        SizedBox(
                          height: 38,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseHeader extends StatelessWidget {
  final Function onTap;
  final Widget child;
  const CourseHeader({@required this.onTap, @required this.child});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: kArrowBack.withOpacity(0.5),
                size: 14,
              ),
              SizedBox(
                width: 10,
              ),
              child,
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

class ProgressNotification extends StatelessWidget {
  final int point;
  final int myPoint;
  final double progressWidth;

  const ProgressNotification({this.point, this.myPoint, this.progressWidth});
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      borderRadius: kAppBorderRadius,
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 25),
            width: 139,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Possible study points:',
                  style: kAppCourseBoxInactive.copyWith(fontSize: 10),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  point?.toString() ?? '1000',
                  style: kAppHeaderText.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          LayoutBuilder(builder: (context, sizeInfo) {
            return Container(
              height: sizeInfo.maxHeight,
              width: 0.2,
              color: kBorderUnFocused,
            );
          }),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Progress(
                    height: 12,
                    width: progressWidth ?? 0.5,
                    color: kAppBlueFade,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$myPoint points acquired',
                        style: kAppCourseBoxInactive,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TransCourseBox extends StatelessWidget {
  final bool isActive;
  TransCourseBox({this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActive ? 1 : 0.3,
      child: Container(
        child: CourseBox(),
      ),
    );
  }
}

class PackDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LessonDisplay(),
        SizedBox(
          height: 20,
        ),
        TestDisplay(
          onTestTap: () {
            Navigator.of(context).pushNamed(TestEntryPage.id);
          },
        ),
      ],
    );
  }
}

class LessonDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      borderRadius: kAppBorderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Text(
              'Lesson Pack 1',
              style: kAppHeaderText.copyWith(fontSize: 12),
            ),
          ),
          Container(
            height: 0.2,
            width: double.infinity,
            color: kBorderUnFocused,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                children: [
                  VideoItem(
                    onTap: () {
                      Navigator.of(context).pushNamed(VideoCoursePage.id);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  VideoItem(
                    onTap: () {
                      Navigator.of(context).pushNamed(VideoCoursePage.id);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  VideoItem(
                    onTap: () {
                      Navigator.of(context).pushNamed(VideoCoursePage.id);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  VideoItem(
                    onTap: () {
                      Navigator.of(context).pushNamed(VideoCoursePage.id);
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class VideoItem extends StatelessWidget {
  final double fontSize;
  final double radius;
  final Function onTap;

  const VideoItem({this.fontSize, this.radius, this.onTap});
  @override
  Widget build(BuildContext context) {
    final double myRadius = radius ?? 9;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: myRadius,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: (myRadius - 2) * 2,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: Text(
                    'Measuring Length 2',
                    overflow: TextOverflow.ellipsis,
                    style:
                        kAppCourseBoxInactive.copyWith(fontSize: fontSize ?? 9),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            '3:00',
            style: kAppCourseBoxInactive.copyWith(fontSize: fontSize ?? 9),
          ),
        ],
      ),
    );
  }
}

class TestDisplay extends StatelessWidget {
  final Widget left;
  final Widget middle;
  final Widget right;
  final Function onTestTap;

  const TestDisplay({this.left, this.middle, this.right, this.onTestTap});
  @override
  Widget build(BuildContext context) {
    final Widget thisLeft = left ??
        Icon(
          Icons.accessibility_new,
          color: Color(0xFFFFAA00),
          size: 50,
        );

    final Widget thisMiddle = middle ??
        Text(
          'Level up on the above skills and collect mastery points',
          style: kAppHeaderText.copyWith(fontSize: 11),
        );

    final Widget thisRight = right ??
        AppButton(
          onTap: onTestTap,
          child: Text(
            'Start Quiz',
            style: TextStyle(
              fontSize: 8.0,
              color: Colors.white,
            ),
          ),
        );
    return RoundedContainer(
      borderRadius: kAppBorderRadius,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          thisLeft,
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: thisMiddle),
          ),
          thisRight
        ],
      ),
    );
  }
}

class StudyPackDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      borderRadius: kAppBorderRadius,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Further your learning with our Study packs',
                  style: kAppHeaderText.copyWith(fontSize: 12),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Subscribe to the Standard plan to access our Study Packs. Our Study Packs contain practice questions that test your learning progress.',
                  style: kAppCourseBoxInactive.copyWith(
                      fontSize: 8,
                      color: kUserNameColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Approximately 12 Study packs',
                  style: kAppHeaderText.copyWith(fontSize: 9),
                ),
                SizedBox(
                  height: 15.0,
                ),
                AppButton(
                  onTap: () {
                    Navigator.of(context).pushNamed(StudyPackPage.id);
                  },
                  child: Text(
                    'Lets Get Started',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kBorderUnFocused,
                  width: 0.1,
                ),
                borderRadius: kAppInnerBorderPartialRadius,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('$kImgUrl/auth_bg.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
