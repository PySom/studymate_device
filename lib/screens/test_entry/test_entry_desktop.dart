import 'package:flutter/material.dart';
import 'package:studymate_app/screens/home/home_desktop_landscape.dart';
import 'package:studymate_app/screens/layout.dart';
import 'package:studymate_app/screens/quiz_layout.dart';
import 'package:studymate_app/screens/quiz_page/quiz_page.dart';
import 'package:studymate_app/utils/constants.dart';

class TestEntryDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      child: TwoSideLayout(
        image: '$kImgUrl/two_side.png',
        right: FourStepLayout(
          header: 'All set for the unit test?',
          child: LayoutBuilder(
            builder: (context, sizeInfo) => Container(
              padding: EdgeInsets.only(right: sizeInfo.maxWidth / 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Donec dapibus mauris id odio ornare tempus. Duis sit amet accumsan justo, quis tempor ligula. Donec dapibus mauris id odio ornare tempus.',
                    style: kAppHeaderText.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '10 Questions',
                    style: kAppHeaderText.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '9 - 12 minutes',
                    style: kAppHeaderText.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          action: () {
            Navigator.of(context).pushNamed(QuizPage.id);
          },
          actionText: 'Let\'s get started',
        ),
      ),
    );
  }
}

class TwoSideLayout extends StatelessWidget {
  final String image;
  final Widget right;

  const TwoSideLayout({@required this.image, this.right});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: kBorderUnFocused,
                width: 0.1,
              ),
              borderRadius: kAppBorderRadius,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: RoundedContainer(
            padding: EdgeInsets.only(left: 30),
            borderRadius: kAppBorderRadius,
            child: right,
          ),
        )
      ],
    );
  }
}

class FourStepLayout extends StatelessWidget {
  final String header;
  final Widget child;
  final Function action;
  final String actionText;
  FourStepLayout({this.header, this.child, this.action, this.actionText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 14.0, right: 14.0),
              child: SmallActionBox(
                onTap: () {},
                icon: Icons.clear,
                color: kAppBlueFade,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header ?? '',
                style: kAppHeaderText.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 20.0,
              ),
              child ?? Container(),
              SizedBox(
                height: 20.0,
              ),
              AppButton(
                onTap: action,
                child: Text(
                  actionText ?? 'Lets get started',
                  style: TextStyle(
                    fontSize: 8.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
