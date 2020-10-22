import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studymate_app/helpers/ui_helpers.dart';
import 'package:studymate_app/screens/layout.dart';
import 'package:studymate_app/utils/constants.dart';

class AuthLayoutDesktop extends StatelessWidget {
  final String svgAsset;
  final Widget displayForm;

  const AuthLayoutDesktop({this.svgAsset, this.displayForm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: scalableSize(context) * 70,
                  horizontal: scalableSize(context) * 100.66),
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage('$kImgUrl/auth_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        '$kImgUrl/studymate_logo.png',
                        height: 20.0,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      '$kImgUrl/$svgAsset',
                      width: 250,
                    ),
                  ),
                  Text(
                    'Welcome to Your Dependable Learning Buddy',
                    textAlign: TextAlign.center,
                    style: kAuthBoldText.copyWith(
                        height: 1.5,
                        color: Colors.white,
                        fontSize: scalableSize(context) * 30.0),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2,
              right: scalableSize(context) * -70.73,
              child: Container(
                child: SizedBox(
                  height: scalableSize(context) * 140.29,
                  width: scalableSize(context) * 141.46,
                  child: Grid(),
                ),
              ),
            ),
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: scalableSize(context) * 240.0,
                  right: scalableSize(context) * 169.27,
                ),
                child: displayForm,
              ),
            ],
          ),
        ))
      ],
    ));
  }
}

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...Iterable<int>.generate(4).toList().map(
              (idx) => GridRow(),
            ),
      ],
    );
  }
}

class GridRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...Iterable<int>.generate(4).toList().map(
              (idx) => CircleAvatar(radius: 3.5, backgroundColor: kAppBlueFade),
            ),
      ],
    );
  }
}

class AuthDialogLayout extends StatelessWidget {
  final String header;
  final Widget child;

  const AuthDialogLayout({this.header, this.child});
  @override
  Widget build(BuildContext context) {
    return AuthDialogWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: kAppHeaderText.copyWith(color: kAppBlue),
          ),
          SizedBox(
            height: 30,
          ),
          child ?? Container(),
        ],
      ),
    );
  }
}

class AuthDialogWrapper extends StatelessWidget {
  final Widget child;

  AuthDialogWrapper({this.child});
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Colors.white,
      hasBorder: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 50),
          child: child,
        ),
      ),
    );
  }
}
