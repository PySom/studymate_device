import 'package:flutter/material.dart';
import 'package:studymate_app/utils/constants.dart';

class ProfileLayout extends StatelessWidget {
  final Widget topLeft;
  final Widget child;

  const ProfileLayout({this.topLeft, this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('$kImgUrl/auth_bg.png'),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80.0, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          '$kImgUrl/studymate_logo.png',
                          height: 20,
                        ),
                        topLeft ?? Container(),
                      ],
                    ),
                    Expanded(child: child ?? Container()),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  top: BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '@2020 All Rights Reserved. Studymate \nPowered by InfoMall Nigeria',
                    textAlign: TextAlign.center,
                    style: kProfileAvatar.copyWith(
                        fontSize: 6, fontWeight: FontWeight.w400, height: 1.5),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
