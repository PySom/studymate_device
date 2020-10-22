import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData myThemeData(BuildContext context) {
  return ThemeData(
    highlightColor: kBorderUnFocused,
    fontFamily: "Montserrat",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimary,
    accentColor: kAccent,
    buttonColor: kButtonColor,
    textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Montserrat'),
    primaryTextTheme:
        Theme.of(context).textTheme.apply(fontFamily: 'Montserrat'),
    accentTextTheme:
        Theme.of(context).textTheme.apply(fontFamily: 'Montserrat'),
    scaffoldBackgroundColor: kPrimary,
    backgroundColor: kPrimary,
//    textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      errorStyle: TextStyle(
        fontSize: 8.0,
      ),
      labelStyle: kFloatingLabelStyle,
      contentPadding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 11.0),
      errorBorder: OutlineInputBorder(
        borderRadius: kAppBorderRadius,
        borderSide: BorderSide(color: kErrorColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: kAppBorderRadius,
        borderSide: BorderSide(color: kBorderFocused, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: kAppBorderRadius,
        borderSide: BorderSide(color: kBorderUnFocused, width: 0.3),
      ),
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: kAccent,
      height: 40,
      // minWidth: double.infinity,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: kAppBorderRadius,
      ),
    ),
    canvasColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      elevation: 2,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
