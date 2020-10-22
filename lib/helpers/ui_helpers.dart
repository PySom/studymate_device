import 'package:flutter/cupertino.dart';
import 'package:studymate_app/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQueryData) {
  double deviceWidth = mediaQueryData.size.shortestSide;
  if (deviceWidth > 950)
    return DeviceScreenType.Desktop;
  else if (deviceWidth > 600)
    return DeviceScreenType.Tablet;
  else
    return DeviceScreenType.Mobile;
}

double scalableSize(BuildContext context) =>
    MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
