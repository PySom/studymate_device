import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  CustomDialog({@required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: child,
    );
  }
}
