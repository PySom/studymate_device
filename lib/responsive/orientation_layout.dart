///This widget sets the ui for the mode of the screen size
///The mode can be [Orientation.landscape] or [Orientation.portrait]
///Check the home view for details
import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;

  const OrientationLayout({Key key, @required this.landscape, this.portrait})
      : super(key: key);
  Widget widgetType(Orientation orientation) {
    switch (orientation) {
      case Orientation.landscape:
        return landscape;
      default:
        return portrait;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widgetType(MediaQuery.of(context).orientation) ?? landscape;
  }
}
