import 'package:flutter/cupertino.dart';
import 'package:studymate_app/enums/device_screen_type.dart';

class SizingInfo {
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInfo({this.deviceScreenType, this.screenSize, this.localWidgetSize});

  @override
  String toString() {
    // TODO: implement toString
    return 'device screen type: $deviceScreenType '
        'screen size is $screenSize '
        'local widget size is $localWidgetSize';
  }
}
