import 'package:flutter/material.dart';
import 'package:studymate_app/screens/auth/register_screen.dart';
import 'package:studymate_app/screens/my_course/my_course.dart';
import 'package:studymate_app/utils/constants.dart';
import '../layout.dart';

class CourseDesktopLandscape extends StatefulWidget {
  @override
  _CourseDesktopLandscapeState createState() => _CourseDesktopLandscapeState();
}

class _CourseDesktopLandscapeState extends State<CourseDesktopLandscape> {
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'My Courses',
                  style: kAppHeaderText.copyWith(fontSize: 16),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: AppSwitch(
                    onTap: () {},
                    leftText: 'Junior Secondary',
                    rightText: 'Senior Secondary',
                    indexActive: 0,
                    fontSize: 10,
                    activeBgColor: kAppBlueFade,
                    inActiveBgColor: kBorderUnFocused.withOpacity(0.07),
                    inActiveTextColor: kAppSwitchInactiveText,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              isAlwaysShown: true,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
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
                            width: 20,
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
                            width: 20,
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
                            width: 20,
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
                            child: CourseBox(),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CourseBox(),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CourseBox(),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CourseBox(),
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
                            child: CourseBox(),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CourseBox(),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CourseBox(),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CourseBox(),
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
          ),
        ],
      ),
    );
  }
}

class CourseBox extends StatelessWidget {
  final double height;
  final Function onTap;

  CourseBox({this.onTap, this.height});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, sizeInfo) => GestureDetector(
        onTap: onTap,
        child: RoundedContainer(
          height: sizeInfo.maxWidth * 1.07,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: sizeInfo.maxWidth * 1.07 / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('$kImgUrl/biology.png'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '25 courses',
                        style: kAppCourseBoxInactive,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'Biology',
                        style: TextStyle(
                            color: kUserNameColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'Introduction to Biology',
                        overflow: TextOverflow.ellipsis,
                        style: kAppCourseBoxInactive,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
