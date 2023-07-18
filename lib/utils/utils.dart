import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
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
}
