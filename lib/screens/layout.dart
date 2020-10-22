import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studymate_app/providers/app_data_provider.dart';
import 'package:studymate_app/screens/choose_profile/choose_profile.dart';
import 'package:studymate_app/screens/course/course.dart';
import 'package:studymate_app/screens/home/home_page.dart';
import 'package:studymate_app/screens/my_course/my_course.dart';
import 'package:studymate_app/screens/profile/profile.dart';
import 'package:studymate_app/utils/constants.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final bool isScrollable;
  final bool isAdjusted;
  final Function onTap;
  Layout({
    this.child,
    this.isScrollable = false,
    this.onTap,
    this.isAdjusted = false,
    this.currentIndex = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(),
                Expanded(
                  child: Container(
                    color: kAppBodyColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                left: 40.0,
                                right: isScrollable
                                    ? 20
                                    : isAdjusted ? 40.0 : 81.0,
                                top: 38,
                                bottom: 0),
                            child: child,
                          ),
                        ),
                        if (isScrollable)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 40.0,
                                  bottom: 50.0,
                                ),
                                child: SmallActionBox(
                                  onTap: onTap,
                                  icon: Icons.keyboard_arrow_up,
                                ),
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SmallActionBox extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final Color color;

  const SmallActionBox({this.onTap, this.icon, this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        height: 35,
        width: 35,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Center(
          child: Icon(
            icon,
            color: color ?? kUserNameColor,
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: kBorderUnFocused,
            width: 0.2,
          ),
        ),
      ),
      height: 40.0,
      padding: kBarPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '@2020 All Rights Reserved. Studymate \nPowered by InfoMall Nigeria',
            style: TextStyle(
                fontSize: 7.0, color: kInactiveTextColor, height: 1.7),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: kBarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SearchBox(),
          SizedBox(
            width: 15.0,
          ),
          CircleAvatar(
            radius: 13,
            backgroundColor: kBorderUnFocused,
            child: CircleAvatar(
              radius: 12.7,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.notifications,
                size: 14,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 30.0,
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        style: TextStyle(fontSize: 10.0, color: kInactiveTextColor),
        decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(Icons.search),
          labelText: 'Search',
          contentPadding: EdgeInsets.all(5.0),
          labelStyle: TextStyle(color: Colors.black, height: 1),
        ),
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 4 / 8,
          right: MediaQuery.of(context).size.width / 4 / 8,
          top: 38,
          bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: kBorderUnFocused,
          width: 0.1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            '$kImgUrl/studymate_logo_dark.png',
            height: 20.0,
          ),
          SizedBox(
            height: 40.0,
          ),
          UserDisplay(),
          SizedBox(
            height: 15.0,
          ),
          Nav(),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Image.asset(
              '$kImgUrl/learners.png',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: kAppInnerBorderRadius,
              ),
              onPressed: () {},
              borderSide: BorderSide(
                color: kBorderUnFocused,
                width: 0.2,
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                    color: kActiveTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ChooseProfilePage.id);
      },
      child: RoundedContainer(
        padding: kRoundedContPadding,
        child: Row(
          children: [
            CircleAvatar(
              radius: 15.0,
              child: Icon(
                Icons.supervised_user_circle,
                size: 30,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Text(
                "Chisom Nwisu",
                style: TextStyle(
                    fontSize: 9.0,
                    color: kUserNameColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int index = AppData.provider(context).currentIndex;
    return RoundedContainer(
      padding: kRoundedContPadding,
      child: Column(
        children: [
          NavItem(
              isActive: index == 0,
              onTap: () {
                Navigator.of(context).pushNamed(HomePage.id);
                AppData.provider(context).setCurrentIndex(0);
              },
              svgAsset: 'home_icon.png',
              name: 'Home'),
          SizedBox(
            height: 5.0,
          ),
          NavItem(
              isActive: index == 1,
              onTap: () {
                Navigator.of(context).pushNamed(CoursePage.id);
                AppData.provider(context).setCurrentIndex(1);
              },
              svgAsset: 'courses_icon.png',
              name: 'My Courses'),
          SizedBox(
            height: 5.0,
          ),
          NavItem(
              isActive: index == 2,
              onTap: () {
                Navigator.of(context).pushNamed(ProfilePage.id);
                AppData.provider(context).setCurrentIndex(2);
              },
              svgAsset: 'user_avatar.png',
              name: 'Profile'),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final bool isActive;
  final Function onTap;
  final String svgAsset;
  final String name;
  NavItem({this.isActive = false, this.svgAsset, this.name, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: kRoundedContPadding,
        hasBorder: false,
        color: isActive ? kAppBlueFade.withOpacity(0.09) : Colors.white,
        child: Row(
          children: [
            Image.asset(
              '$kImgUrl/$svgAsset',
              height: 15,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: TextStyle(
                color: isActive ? kActiveTextColor : Colors.black,
                fontSize: 9.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final bool hasBorder;
  final Color color;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  RoundedContainer(
      {this.child,
      this.padding,
      this.width,
      this.hasBorder = true,
      this.color = Colors.white,
      this.height,
      this.borderRadius = kAppInnerBorderRadius});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: hasBorder
            ? Border.all(
                color: kBorderUnFocused,
                width: 0.1,
              )
            : null,
        borderRadius: borderRadius,
      ),
      padding: padding,
      width: width,
      height: height,
      child: child,
    );
  }
}
