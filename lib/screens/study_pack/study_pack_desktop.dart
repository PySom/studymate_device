import 'package:flutter/material.dart';
import 'package:studymate_app/screens/my_course/my_course_desktop.dart';
import 'package:studymate_app/utils/constants.dart';

import '../layout.dart';

class StudyPackDesktop extends StatefulWidget {
  @override
  _StudyPackDesktopState createState() => _StudyPackDesktopState();
}

class _StudyPackDesktopState extends State<StudyPackDesktop> {
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
        children: [
          CourseHeader(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'StudyPack',
              style: kAppHeaderText,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ProgressNotification(
            progressWidth: 0.5,
            point: 1000,
            myPoint: 400,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  StudyTestDisplay(),
                  SizedBox(
                    height: 10,
                  ),
                  StudyTestDisplay(),
                  SizedBox(
                    height: 10,
                  ),
                  StudyTestDisplay(),
                  SizedBox(
                    height: 10,
                  ),
                  StudyTestDisplay(),
                  SizedBox(
                    height: 10,
                  ),
                  StudyTestDisplay(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StudyTestDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestDisplay(
      middle: LayoutBuilder(
        builder: (context, sizeInfo) => Padding(
          padding: EdgeInsets.only(right: sizeInfo.maxWidth / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'StudyPack 1',
                style: kAppHeaderText.copyWith(fontSize: 10),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Level up on the above skills and collect mastery points',
                style: kAppHeaderText.copyWith(
                    fontSize: 10, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
