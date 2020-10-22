import 'package:flutter/material.dart';
import 'package:studymate_app/screens/course/course.dart';
import 'package:studymate_app/screens/recent_courses/recent_courses.dart';
import 'package:studymate_app/utils/constants.dart';

import '../layout.dart';

class HomeDesktopLandscape extends StatelessWidget {
  static const String text =
      'Fusce at nisi eget dolor rhoncus facilisis. Mauris ante nisl, consectetur et luctus et, '
      'Sed eu nunc sit amet elit euismod faucibus. Class aptent taciti sociosqu ';
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BannerDisplay(),
            SizedBox(
              height: 30.0,
            ),
            RoundedContainer(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Learn anything \nanytime, anywhere',
                            style: TextStyle(
                                color: kAppBlue,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            text,
                            style: TextStyle(fontSize: 10.0),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          AppButton(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(RecentCoursePage.id);
                            },
                            child: Text(
                              'Lets get started',
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image.asset('$kImgUrl/lotus_point.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 38,
            ),
          ],
        ),
      ),
    );
  }
}

class BannerDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('$kImgUrl/home_banner.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Your Dependable Learning Buddy',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final EdgeInsets padding;
  final Color color;
  final Widget child;
  final BorderRadius borderRadius;
  final Function onTap;

  const AppButton(
      {this.padding,
      this.color,
      @required this.child,
      @required this.onTap,
      this.borderRadius});
  @override
  Widget build(BuildContext context) {
    final EdgeInsets setPadding =
        padding ?? EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0);
    final Color setColor = color ?? kAppBlueFade;

    return ButtonTheme(
      padding: setPadding, //adds padding inside the button
      materialTapTargetSize: MaterialTapTargetSize
          .shrinkWrap, //limits the touch area to the button area
      minWidth: 0, //wraps child's width
      textTheme: ButtonTextTheme.primary,
      height: 0, //wraps child's height
      child: FlatButton(
          onPressed: onTap,
          color: setColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? kAppInnerBorderRadius,
          ),
          child: child), //your original button
    );
  }
}

class AppOutlineButton extends StatelessWidget {
  final EdgeInsets padding;
  final Color color;
  final Widget child;
  final double width;
  final Function onTap;

  const AppOutlineButton(
      {this.padding,
      this.color,
      @required this.child,
      @required this.onTap,
      this.width});
  @override
  Widget build(BuildContext context) {
    final EdgeInsets setPadding =
        padding ?? EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0);
    final Color setColor = color ?? kAppBlueFade;

    return ButtonTheme(
      padding: setPadding, //adds padding inside the button
      materialTapTargetSize: MaterialTapTargetSize
          .shrinkWrap, //limits the touch area to the button area
      minWidth: 0, //wraps child's width
      height: 0, //wraps child's height
      child: OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: kAppInnerBorderRadius,
          ),
          onPressed: onTap,
          borderSide: BorderSide(
            color: setColor,
            width: width ?? 0.3,
          ),
          child: child), //your original button
    );
  }
}
