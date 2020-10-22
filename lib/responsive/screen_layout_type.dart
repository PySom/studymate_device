///This widget sets the layout for the device type
///The device type can be [DeviceScreenType.Desktop] or
///[DeviceScreenType.Tablet] or [DeviceScreenType.Mobile]
import 'package:flutter/material.dart';
import 'package:studymate_app/enums/device_screen_type.dart';
import 'package:studymate_app/ui/responsive_builder.dart';

class ScreenLayoutType extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenLayoutType(
      {Key key, this.mobile, this.tablet, @required this.desktop})
      : super(key: key);

  Widget widgetType(DeviceScreenType deviceScreenType) {
    switch (deviceScreenType) {
      case DeviceScreenType.Mobile:
        return mobile;
      case DeviceScreenType.Tablet:
        return tablet;
      default:
        return desktop;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return widgetType(sizingInfo.deviceScreenType) ?? desktop;
      },
    );
  }
}
