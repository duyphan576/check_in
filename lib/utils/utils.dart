import 'package:check_in/core/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Future<void> setFcmId(String fcmId) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setString(fcmId, fcmId);
  }

  static Future<String?> getFcmId(String fcmId) async {
    return (await SharedPreferences.getInstance()).getString(fcmId) ?? null;
  }

  static getFileNameFromFilePath(String filePath) {
    final pathArr = filePath.split("/");
    return pathArr[pathArr.length - 1];
  }

  static changeLanguage(BuildContext context, lang) async {
    var currentLang = FlutterI18n.currentLocale(context);
    currentLang = Locale(lang);
    await FlutterI18n.refresh(context, currentLang);
  }

  static getWifiName() async {
    try {
      bool serviceEnabled;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Alert.showErrorGeolocator(
          title: "Lỗi",
          message: "Thiết bị không cho phép truy cập vị trí.",
          buttonTextOK: "Đi tới cài đặt",
          buttonTextCancel: "Cancel",
          onPressed: () async {
            await Geolocator.openLocationSettings();
            Get.back();
          },
        );
        return Future.error('Location services are disabled.');
      }

      print('Checking Android permissions');
      PermissionStatus status = await Permission.location.status;

      if (status.isDenied || status.isRestricted) {
        if (!(await Permission.location.request().isGranted)) {
          print('Location permission not granted');
          Alert.showErrorGeolocator(
            title: "Lỗi",
            message: "Ứng dụng không cho phép truy cập vị trí.",
            buttonTextOK: "Mở cài đặt ứng dụng",
            buttonTextCancel: "Cancel",
            onPressed: () async {
              openAppSettings();
              Get.back();
            },
          );
        }
      } else {
        final info = NetworkInfo();
        var wifiName = await info.getWifiName();
        var wifiBSSID = await info.getWifiBSSID();
        String nameWifi = wifiName.toString().replaceAll('"', "");
        String bssidWifi = wifiBSSID.toString().replaceAll('"', "");
        print("wifiName:  " + nameWifi);
        print("bssidWifi:  " + bssidWifi);
        return {
          "wifiName": nameWifi,
          "bssidWifi": bssidWifi,
        };
      }

      // permission = await Geolocator.checkPermission();
      // if (permission == LocationPermission.denied) {
      //   permission = await Geolocator.requestPermission();
      //   if (permission == LocationPermission.denied) {
      //     print("Aaaaaaaaaaaaa");
      //     await Geolocator.openLocationSettings();
      //   }
      // }
      //
      // if (permission == LocationPermission.deniedForever) {
      //   Alert.showErrorGeolocator(
      //     title: "Lỗi",
      //     message: "Thiết bị không cho phép truy cập vị trí.",
      //     buttonTextOK: "Đi tới cài đặt",
      //     buttonTextCancel: "Cancel",
      //     onPressed: () async {
      //       await Geolocator.openLocationSettings();
      //       Get.back();
      //     },
      //   );
      // }

      // if (permission == LocationPermission.whileInUse ||
      //     permission == LocationPermission.always) {
      //   final info = NetworkInfo();
      //   var wifiName = await info.getWifiName();
      //   var wifiBSSID = await info.getWifiBSSID();
      //   String nameWifi = wifiName.toString().replaceAll('"', "");
      //   String bssidWifi = wifiBSSID.toString().replaceAll('"', "");
      //   print("wifiName:  " + nameWifi);
      //   print("bssidWifi:  " + bssidWifi);
      //   return {
      //     "wifiName": nameWifi,
      //     "bssidWifi": bssidWifi,
      //   };
      // }
    } catch (error) {
      await Geolocator.requestPermission();
    }
  }
}
