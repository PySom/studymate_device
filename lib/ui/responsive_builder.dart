import 'package:flutter/material.dart';
import 'package:studymate_app/helpers/ui_helpers.dart';
import 'package:studymate_app/ui/sizing_info.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInfo sizingInfo) builder;

  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        SizingInfo sizingInfo = SizingInfo(
            deviceScreenType: getDeviceType(mediaQueryData),
            screenSize: mediaQueryData.size,
            localWidgetSize:
                Size(boxConstraints.maxWidth, boxConstraints.maxHeight));
        return builder(context, sizingInfo);
      },
    );
  }
}
