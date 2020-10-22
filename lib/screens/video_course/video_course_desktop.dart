import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studymate_app/helper_widgets/video_player.dart';
import 'package:studymate_app/screens/home/home_desktop_landscape.dart';
import 'package:studymate_app/screens/my_course/my_course_desktop.dart';
import 'package:studymate_app/screens/test_entry/test_entry.dart';
import 'package:studymate_app/utils/constants.dart';

import '../layout.dart';

class VideoCourseDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String text =
        'Fusce at nisi eget dolor rhoncus facilisis. Mauris ante nisl, consectetur et luctus et, '
        'porta ut dolor. Curabitur ultricies ultrices nulla. Morbi blandit nec est vitae dictum. '
        'per inceptos himenaeos. Duis gravida eget neque vel vulputate.';
    return Layout(
      isAdjusted: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (context, parentSize) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: LayoutBuilder(builder: (context, sizeInfo) {
                            print(sizeInfo.maxWidth);
                            print(sizeInfo.maxHeight);
                            return VideoDisplay(
                              key: GlobalKey(),
                              isFullScreen: false,
                              width: sizeInfo.maxWidth,
                              height: sizeInfo.maxWidth * 9 / 16,
                            );
                          }),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: LayoutBuilder(builder: (context, littleSize) {
                            return AvailableVideo(
                              height: (parentSize.maxWidth -
                                      littleSize.maxWidth -
                                      20) *
                                  (9 / 16),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Measuring lengths with different units',
                              style: kAppHeaderText.copyWith(fontSize: 12),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              text,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  height: 1.8),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: RoundedContainer(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'Level up on the above skills and collect mastery points',
                                    style: kAppHeaderText.copyWith(fontSize: 7),
                                  ),
                                ),
                              ),
                              AppOutlineButton(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(TestEntryPage.id);
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    fontSize: 5.5,
                                    color: kAppBlueFade,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 38,
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

class TwoRowLayout extends StatelessWidget {
  final double height;
  final double width;
  final Widget header;
  final Widget child;

  const TwoRowLayout({this.height, this.width, this.header, this.child});
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      borderRadius: kAppBorderRadius,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: header,
          ),
          Container(
            height: 0.2,
            width: double.infinity,
            color: kBorderUnFocused,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class AvailableVideo extends StatelessWidget {
  final double height;
  final double width;

  const AvailableVideo({this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return TwoRowLayout(
      height: height,
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Intermediate',
            style: kAppHeaderText.copyWith(fontSize: 10),
          ),
          SizedBox(
            height: 5,
          ),
          Header(),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SelectableVideoItem(),
            SelectableVideoItem(),
            SelectableVideoItem(
              isActive: true,
            ),
            SelectableVideoItem(),
            SelectableVideoItem(),
            SelectableVideoItem(),
          ],
        ),
      ),
    );
  }
}

class SelectableVideoItem extends StatelessWidget {
  final bool isActive;

  const SelectableVideoItem({this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isActive ? kAppBlueFade.withOpacity(0.05) : null,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: VideoItem(
        fontSize: 8,
        radius: 7,
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HeaderData(icon: Icons.play_arrow, text: '100 videos'),
        SizedBox(
          width: 6,
        ),
        HeaderData(icon: Icons.bookmark, text: '6 topics'),
        SizedBox(
          width: 6,
        ),
        HeaderData(icon: Icons.access_time, text: '1hr 30mins'),
      ],
    );
  }
}

class HeaderData extends StatelessWidget {
  final IconData icon;
  final String text;

  const HeaderData({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: kAppBlueFade,
          size: 12,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: kAppCourseBoxInactive.copyWith(
              fontSize: 6, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
