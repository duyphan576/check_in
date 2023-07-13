import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DeviceInfo {
  String deviceName;
  String deviceVersion;
  String identifier;

  DeviceInfo({
    required this.deviceName,
    required this.deviceVersion,
    required this.identifier,
  });
}

Future<DeviceInfo> getDeviceDetails() async {
  String deviceName = '';
  String deviceVersion = '';
  String identifier = '';
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      deviceName = build.model.toString();
      deviceVersion = build.version.toString();
      identifier = build.id.toString();
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      deviceName = data.name.toString();
      deviceVersion = data.systemVersion.toString();
      identifier = data.identifierForVendor.toString();
    }
  } on PlatformException {
    debugPrint('Failed to get platform version');
  }
  return DeviceInfo(
    deviceName: deviceName,
    deviceVersion: deviceVersion,
    identifier: identifier,
  );
}
