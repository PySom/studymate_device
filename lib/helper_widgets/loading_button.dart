import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:studymate_app/screens/home/home_desktop_landscape.dart';
import 'package:studymate_app/utils/constants.dart';

class LoadingButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final TextStyle style;
  final EdgeInsets padding;
  final Function action;
  LoadingButton({
    this.text,
    this.isLoading,
    this.action,
    this.style,
    this.padding,
  });

  Widget _spinner(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation<Color>(kPrimary),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppButton(
      borderRadius: kAppBorderRadius,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: kButtonColor,
      onTap: () async {
        try {
          await action();
        } catch (ex) {
          Flushbar(
            backgroundColor: kAccent,
            message: ex.toString(),
            duration: Duration(seconds: 3),
            flushbarStyle: FlushbarStyle.GROUNDED,
          ).show(context);
        }
      },
      child: isLoading
          ? _spinner(context)
          : Text(
              text,
              style: style,
            ),
    );
  }
}
