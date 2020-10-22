import 'package:flutter/material.dart';
import 'package:studymate_app/screens/my_course/my_course.dart';
import 'package:studymate_app/screens/test_entry/test_entry_desktop.dart';
import 'package:studymate_app/utils/constants.dart';

import '../quiz_layout.dart';

class TestDoneDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      child: TwoSideLayout(
        image: '$kImgUrl/two_side.png',
        right: FourStepLayout(
          header: 'Thanks for taking the test',
          child: LayoutBuilder(
            builder: (context, sizeInfo) => Container(
              padding: EdgeInsets.only(right: sizeInfo.maxWidth / 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Score',
                    style: kAppHeaderText.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '4% (3/10 correct)',
                    style: kAppHeaderText.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Learning Points',
                    style: kAppHeaderText.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '80% (400 points)',
                    style: kAppHeaderText.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          action: () {
            Navigator.of(context).pushNamed(MyCoursePage.id);
          },
          actionText: 'Back to Quiz',
        ),
      ),
    );
  }
}
