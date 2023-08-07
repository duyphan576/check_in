import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../constants/index.dart';

class Alert {
  static Duration duration = const Duration(seconds: 2);

  static void showLoadingIndicator({required String message}) {
    Get.dialog(
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              message,
              style: TextStyle(
                  fontSize: 14,
                  color: AppColors.white,
                  decoration: TextDecoration.none),
            )
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void closeLoadingIndicator() {
    Get.back();
  }

  static Future<dynamic> showSuccess({
    required String title,
    String? message,
    required String buttonText,
  }) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message ?? ""),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(buttonText),
            onPressed: () => {
              Get.back(),
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static Future<dynamic> showInfo({
    required String title,
    required Classroom classroom,
    required String buttonText,
  }) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Divider(
                  thickness: 1.0,
                  color: AppColors.lightBlack,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${DetailString.LECTURE}: ${classroom.lecturer!.fullname}",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GlobalStyles.sizedBoxHeight_10,
                      Text(
                        "${DetailString.LECTURE_ID}: ${classroom.lecturer!.code}",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  GlobalStyles.sizedBoxWidth,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${DetailString.TERM_ID}: ${classroom.term!.id.toString()}",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GlobalStyles.sizedBoxHeight_10,
                      Text(
                        "${DetailString.TERM_CREDIT}: ${classroom.term!.credit.toString()}",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(buttonText),
            onPressed: () => {
              Get.back(),
            },
          )
        ],
      ),
    );
  }

  static Future<dynamic> showError(
      {required String title,
      required String message,
      required String buttonText}) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(buttonText),
            onPressed: () => Get.back(),
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static Future<dynamic> selectFile() async {
    return showDialog(
      context: Get.context!,
      builder: (_) => Dialog(
        insetPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Builder(
          builder: (context) {
            var width = MediaQuery.of(context).size.width;

            return Container(
              width: width,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      FlutterI18n.translate(context, "COMMON.uploadFile"),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextButton(
                          style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              overlayColor: MaterialStateProperty.all(
                                  AppColors.gray.withOpacity(0.2)),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(horizontal: 15))),
                          onPressed: () => Get.back(result: "image"),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              FlutterI18n.translate(context, "COMMON.image"),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  ),
                  Container(
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: TextButton(
                          style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              overlayColor: MaterialStateProperty.all(
                                  AppColors.gray.withOpacity(0.2)),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(horizontal: 15))),
                          onPressed: () => Get.back(result: "pdf"),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              FlutterI18n.translate(context, "COMMON.pdf"),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: TextButton(
                          style: ButtonStyle(
                              alignment: Alignment.bottomRight,
                              overlayColor: MaterialStateProperty.all(
                                  AppColors.gray.withOpacity(0.2)),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(horizontal: 15))),
                          onPressed: () => Get.back(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              FlutterI18n.translate(context, "COMMON.cancel"),
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static Future<dynamic> showConfirmDialog({detail}) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(FlutterI18n.translate(context, "COMMON.confirm")),
        content: Text(detail ?? ""),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(FlutterI18n.translate(context, "COMMON.ok")),
            onPressed: () => Get.back(result: true),
          ),
          CupertinoDialogAction(
            child: Text(FlutterI18n.translate(context, "COMMON.cancel")),
            onPressed: () => Get.back(result: false),
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static Future<dynamic> showSelectImage() {
    /* -- 1 for camera
       -- 2 for photo
     */
    return Get.bottomSheet(
      SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.circular(15)),
            child: CupertinoActionSheet(
                title: Column(
                  children: [
                    Text(
                      FlutterI18n.translate(
                          Get.context!, "addRequest.attachments"),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(FlutterI18n.translate(
                          Get.context!, "addRequest.typeFile")),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: CupertinoDialogAction(
                      child: Text(
                        FlutterI18n.translate(Get.context!, "addRequest.image"),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      onPressed: () => Get.back(result: "image"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: CupertinoDialogAction(
                      child: Text(
                        FlutterI18n.translate(
                            Get.context!, "addRequest.document"),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      onPressed: () => Get.back(result: "document"),
                    ),
                  ),
                ]),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.circular(14)),
            child: CupertinoActionSheet(actions: [
              CupertinoDialogAction(
                child: Center(
                  child: Text(
                    FlutterI18n.translate(Get.context!, "addRequest.cancel"),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                onPressed: () => Get.back(),
              ),
            ]),
          )
        ],
      )),
      isScrollControlled: true,
    );
  }

  static Future<dynamic> showImageModal(
      {required String appbarTitle,
      required List<dynamic>? imageList,
      required int index}) {
    return Get.generalDialog(
      barrierColor: Colors.white,
      barrierDismissible: false,
      pageBuilder: (_, __, ___) {
        return SizedBox.expand(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    size: 20,
                    color: AppColors.main,
                  ),
                  onPressed: () => Get.back(),
                ),
                title: Text(
                  appbarTitle,
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                automaticallyImplyLeading: false,
              ),
              body: PageView.builder(
                  itemCount: imageList!.length,
                  controller: PageController(initialPage: index),
                  itemBuilder: (context, index) {
                    return PhotoView(
                      imageProvider: NetworkImage(
                          "${dotenv.env['APIURL']}" + imageList[index]!),
                      backgroundDecoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    );
                  })),
        );
      },
    );
  }

  static Future<dynamic> showQuestionDeleteAccount({
    String? message,
    String? textConfirm,
    String? yesButton,
    String? cancelButton,
    Function()? functionYes,
  }) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.main),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              textConfirm ?? "",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    cancelButton ?? "",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.gray,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: Color(0xff333333),
                          ),
                          borderRadius: BorderRadius.circular(10)))),
              TextButton(
                  onPressed: functionYes ?? () => Get.back(result: true),
                  child: Text(yesButton ?? ""),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.main,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: AppColors.main),
                        borderRadius: BorderRadius.circular(10)),
                  )),
            ],
          )
        ],
      ),
    );
  }

  static Future<dynamic> showImageModalFile(
      {required String appbarTitle,
      required List<dynamic>? imageList,
      required int index}) {
    return Get.generalDialog(
      barrierColor: Colors.white,
      barrierDismissible: false,
      pageBuilder: (_, __, ___) {
        return SizedBox.expand(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    size: 20,
                    color: AppColors.main,
                  ),
                  onPressed: () => Get.back(),
                ),
                title: Text(
                  appbarTitle,
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                automaticallyImplyLeading: false,
              ),
              body: PageView.builder(
                  itemCount: imageList!.length,
                  controller: PageController(initialPage: index),
                  itemBuilder: (context, index) {
                    return PhotoView(
                      imageProvider: FileImage(imageList[index]),
                    );
                  })),
        );
      },
    );
  }

  static Future<dynamic> showErrorGeolocator({
    required String title,
    required String message,
    required String buttonTextOK,
    required String buttonTextCancel,
    required onPressed,
  }) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(buttonTextCancel),
            onPressed: () => Get.back(),
          ),
          CupertinoDialogAction(
            child: Text(buttonTextOK),
            onPressed: onPressed,
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static Future<dynamic> showBarChart({
    required String title,
    required double gradesLength,
    required List<BarChartGroupData> barGroupsList,
    required String buttonText,
  }) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    GlobalStyles.sizedBoxHeight_25,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: BarChart(
                          BarChartData(
                              minY: 0,
                              maxY: gradesLength,
                              titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      int xvalue = value.toInt();

                                      if (xvalue == 0) {
                                        return Text(
                                          "F",
                                          style: TextStyle(color: Colors.black),
                                        );
                                      } else if (xvalue == 1) {
                                        return Text(
                                          "D",
                                          style: TextStyle(color: Colors.black),
                                        );
                                      } else if (xvalue == 2) {
                                        return Text(
                                          "C",
                                          style: TextStyle(color: Colors.black),
                                        );
                                      } else if (xvalue == 3) {
                                        return Text(
                                          "B",
                                          style: TextStyle(color: Colors.black),
                                        );
                                      } else if (xvalue == 4) {
                                        return Text(
                                          "A",
                                          style: TextStyle(color: Colors.black),
                                        );
                                      }
                                      return Text(
                                        xvalue.toInt().toString(),
                                        style: TextStyle(color: Colors.black),
                                      );
                                    },
                                  )),
                                  leftTitles: AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  topTitles: AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  rightTitles: AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false))),
                              borderData: FlBorderData(
                                border: Border(
                                    top: BorderSide.none,
                                    right: BorderSide.none,
                                    left: BorderSide.none,
                                    bottom: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    )),
                              ),
                              barTouchData: BarTouchData(
                                enabled: false,
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.transparent,
                                  tooltipPadding: EdgeInsets.zero,
                                  tooltipMargin: 8,
                                  getTooltipItem: (
                                    BarChartGroupData group,
                                    int groupIndex,
                                    BarChartRodData rod,
                                    int rodIndex,
                                  ) {
                                    return BarTooltipItem(
                                      rod.toY.round().toString(),
                                      const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              barGroups: barGroupsList,
                              gridData: FlGridData(show: false)),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GlobalStyles.sizedBoxHeight_10,
                        Text(StatisticalString.BAR_NOTE,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16)),
                        GlobalStyles.sizedBoxHeight_10,
                        Text(
                          StatisticalString.GRADE_F,
                          style: TextStyle(fontSize: 11.5),
                        ),
                        GlobalStyles.sizedBoxHeight_10,
                        Text(
                          StatisticalString.GRADE_D,
                          style: TextStyle(fontSize: 11.5),
                        ),
                        GlobalStyles.sizedBoxHeight_10,
                        Text(
                          StatisticalString.GRADE_C,
                          style: TextStyle(fontSize: 11.5),
                        ),
                        GlobalStyles.sizedBoxHeight_10,
                        Text(
                          StatisticalString.GRADE_B,
                          style: TextStyle(fontSize: 11.5),
                        ),
                        GlobalStyles.sizedBoxHeight_10,
                        Text(
                          StatisticalString.GRADE_A,
                          style: TextStyle(fontSize: 11.5),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(buttonText),
            onPressed: () => {
              Get.back(),
            },
          )
        ],
      ),
    );
  }
}
