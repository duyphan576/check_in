import 'package:check_in/constants/app_string.dart';
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
          title: CommonString.ERROR,
          message: AppString.GEO_ERROR,
          buttonTextOK: AppString.GO_TO_SETTINGS,
          buttonTextCancel: CommonString.CANCEL,
          onPressed: () async {
            await Geolocator.openLocationSettings();
            Get.back();
          },
        );
        return Future.error(AppString.LOCATION_DISALBE);
      }

      PermissionStatus status = await Permission.location.status;

      if (status.isDenied || status.isRestricted) {
        if (!(await Permission.location.request().isGranted)) {
          Alert.showErrorGeolocator(
            title: CommonString.ERROR,
            message: AppString.GEO_ERROR,
            buttonTextOK: AppString.GO_TO_SETTINGS,
            buttonTextCancel: CommonString.CANCEL,
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

        return {
          "wifiName": nameWifi,
          "bssidWifi": bssidWifi,
        };
      }
    } catch (error) {
      await Geolocator.requestPermission();
    }
  }
}
