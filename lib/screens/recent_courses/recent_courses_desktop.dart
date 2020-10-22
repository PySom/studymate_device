import 'package:flutter/material.dart';
import 'package:studymate_app/screens/course/course_desktop_portrait.dart';
import 'package:studymate_app/screens/home/home_desktop_landscape.dart';
import 'package:studymate_app/screens/my_course/my_course.dart';
import 'package:studymate_app/utils/constants.dart';

import '../layout.dart';

class RecentCourseDesktop extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _controller,
        child: SingleChildScrollView(
          controller: _controller,
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BannerDisplay(),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Recent Courses',
                        style: kAppHeaderText.copyWith(fontSize: 16.0),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Latest Quiz',
                        style: kAppHeaderText.copyWith(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CourseBox(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyCoursePage.id);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CourseBox(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyCoursePage.id);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CourseBox(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyCoursePage.id);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CourseBox(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyCoursePage.id);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CourseBox(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyCoursePage.id);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CourseBox(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyCoursePage.id);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CourseBox(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyCoursePage.id);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CourseBox(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyCoursePage.id);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CourseBox(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyCoursePage.id);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LatestQuiz(),
                          SizedBox(
                            height: 20.0,
                          ),
                          LatestQuiz(),
                          SizedBox(
                            height: 20.0,
                          ),
                          LatestQuiz(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LatestQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            child: Icon(
              Icons.search,
              size: 10,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '-0 h 55 min',
                        style: kAppCourseBoxInactive,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Biology',
                        style: TextStyle(
                            color: kUserNameColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Level up on the above skills and collect mastery points',
                        style: kAppCourseBoxInactive,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Progress(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '12%',
                      style: kAppCourseBoxInactive,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Progress extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double parentWidth;
  const Progress(
      {this.height = 5,
      this.color = kAppBlueFade,
      this.width = 0.12,
      this.parentWidth});
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      height: height,
      width: parentWidth,
      color: kBadgeColor,
      hasBorder: false,
      child: LayoutBuilder(builder: (context, sizeInfo) {
        return Row(
          children: [
            RoundedContainer(
              height: height,
              width: sizeInfo.maxWidth * width,
              hasBorder: false,
              color: color,
            ),
          ],
        );
      }),
    );
  }
}
