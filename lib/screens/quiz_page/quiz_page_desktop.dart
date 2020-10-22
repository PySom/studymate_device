import 'package:flutter/material.dart';
import 'package:studymate_app/screens/home/home_desktop_landscape.dart';
import 'package:studymate_app/screens/layout.dart';
import 'package:studymate_app/screens/recent_courses/recent_courses_desktop.dart';
import 'package:studymate_app/screens/test_done/test_done.dart';
import 'package:studymate_app/screens/video_course/video_course_desktop.dart';
import 'package:studymate_app/utils/constants.dart';

import '../quiz_layout.dart';

class QuizDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QuizDisplay();
  }
}

class QuizDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: RoundedContainer(
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              borderRadius: kAppBorderRadius,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mathematics - Quiz 1',
                        style: kAppHeaderText.copyWith(
                            fontWeight: FontWeight.w700,
                            color: kQuizIdentity.withOpacity(0.7),
                            fontSize: 12),
                      ),
                      SmallActionBox(
                        onTap: () {},
                        icon: Icons.clear,
                        color: kAppBlueFade,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Progress(
                    height: 12,
                    width: 0.5,
                    color: kAppBlueFade,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Musa has a choice of buying a shirt and a bag. What is the opportunity cost of buying a book?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              height: 1.6),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OptionArea(
                          onTap: () {},
                          isCorrect: true,
                          option: 'A',
                          optionText: 'A book and a bag',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OptionArea(
                          onTap: () {},
                          isCorrect: false,
                          option: 'B',
                          optionText: 'Bag only',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OptionArea(
                          onTap: () {},
                          isCorrect: false,
                          option: 'C',
                          optionText: 'A shirt and a bag',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OptionArea(
                          onTap: () {},
                          isCorrect: false,
                          option: 'D',
                          optionText: 'A shirt only',
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppButton(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(TestDonePage.id);
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 8.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 1,
            child: QuestionNumberDisplay(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
          )
        ],
      ),
    );
  }
}

class OptionArea extends StatelessWidget {
  final bool isCorrect;
  final String option;
  final String optionText;
  final Function onTap;
  OptionArea({this.isCorrect, this.option, this.optionText, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: isCorrect ? kCorrectOption : kDefaultOptionBorder,
            child: CircleAvatar(
              radius: 7.5,
              backgroundColor: isCorrect ? kCorrectOption : Colors.white,
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 6,
                  fontWeight: FontWeight.w800,
                  color: isCorrect ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            optionText,
            style: TextStyle(
              color: isCorrect ? kCorrectOption : Colors.black,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}

class QuestionNumberDisplay extends StatelessWidget {
  final double height;
  final double width;

  QuestionNumberDisplay({this.height, this.width});
  @override
  Widget build(BuildContext context) {
    final List<int> nos = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20
    ];

    return TwoRowLayout(
      height: height,
      header: Text(
        'Question Numbers',
        style:
            kAppHeaderText.copyWith(fontWeight: FontWeight.w700, fontSize: 12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 18),
        child: SingleChildScrollView(
          child: Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            runSpacing: 10,
            spacing: 0,
            children: nos.map((e) {
              return CurrentNumber(
                text: e.toString(),
                isCurrent: nos.indexOf(e) == 5,
                isCorrect: nos.indexOf(e) == 0 ||
                    nos.indexOf(e) == 1 ||
                    nos.indexOf(e) == 4,
                isWrong: nos.indexOf(e) == 2 || nos.indexOf(e) == 3,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CurrentNumber extends StatelessWidget {
  final String text;
  final bool isCurrent;
  final bool isCorrect;
  final bool isWrong;

  CurrentNumber({this.text, this.isCurrent, this.isCorrect, this.isWrong});
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      hasBorder: false,
      color: isCurrent ? kAppBlueFade : Colors.white,
      height: 30,
      width: 30,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: isCurrent
                ? Colors.white
                : isCorrect
                    ? Colors.green
                    : isWrong
                        ? Colors.red
                        : kAppSwitchInactiveText.withOpacity(0.17),
          ),
        ),
      ),
    );
  }
}
