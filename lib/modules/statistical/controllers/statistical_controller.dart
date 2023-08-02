import 'package:check_in/constants/index.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/statistical/models/statistical_model.dart';

import 'package:check_in/modules/statistical/repository/statistical_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

RxBool isLoading = true.obs;

class StatisticalController extends GetxController with CacheManager {
  final StatisticalRepository statisticalRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  bool isClassroom = Get.arguments['isClassroom'];
  var countLessThan4 = 0.0;
  var countForm4ToLessThan55 = 0.0;
  var countForm55ToLessThan7 = 0.0;
  var countFor7ToLessThan85 = 0.0;
  var countGreaterThan85 = 0.0;
  var countLessThan4Percentage = 0.0;
  var countForm4ToLessThan55Percentage = 0.0;
  var countForm55ToLessThan7Percentage = 0.0;
  var countFor7ToLessThan85Percentage = 0.0;
  var countGreaterThan85Percentage = 0.0;
  List<double?> grades = [];
  List<double> count = [];
  List<double> gradesFinal = [];
  RxBool isLoading = true.obs;

  StatisticalController({required this.statisticalRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getGradesData();
  }

  void getGradesData() async {
    isLoading.value = true;
    int classroomId = int.parse(Get.arguments['classroomId']);
    final response = await statisticalRepository.statistical(
      StatisticalModel(classroomId: classroomId.toString()),
      UrlProvider.HANDLES_SATISTICAL,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      List<dynamic> gradeList = response?.data['examGradeList'];
      if (response?.data['examGradeList'].isEmpty) {
        Alert.showError(
                title: "Thất bại",
                message: StatisticalString.GRADE_EMPTY,
                buttonText: AppString.CANCEL)
            .then((value) => Alert.closeLoadingIndicator());
      } else {
        List<double?> gradesList = gradeList.map((dynamic item) {
          if (item is int) {
            return item.toDouble();
          } else if (item is double) {
            return item;
          } else {
            return null;
          }
        }).toList();
        grades.addAll(gradesList);
        for (int i = 0; i < grades.length; i++) {
          if (grades[i]! < 4) {
            countLessThan4++;
          } else if (grades[i]! >= 4 && grades[i]! < 5.5) {
            countForm4ToLessThan55++;
          } else if (grades[i]! >= 5.5 && grades[i]! < 7) {
            countForm55ToLessThan7++;
          } else if (grades[i]! >= 7 && grades[i]! < 8.5) {
            countFor7ToLessThan85++;
          } else if (grades[i]! >= 8.5) {
            countGreaterThan85++;
          }
        }

        countList();
        countLessThan4Percentage = calculatePercent(
            countLessThan4, double.parse(grades.length.toString()));
        countForm4ToLessThan55Percentage = calculatePercent(
            countForm4ToLessThan55, double.parse(grades.length.toString()));
        countForm55ToLessThan7Percentage = calculatePercent(
            countForm55ToLessThan7, double.parse(grades.length.toString()));
        countFor7ToLessThan85Percentage = calculatePercent(
            countFor7ToLessThan85, double.parse(grades.length.toString()));
        countGreaterThan85Percentage = calculatePercent(
            countGreaterThan85, double.parse(grades.length.toString()));
        update();
        isLoading.value = false;
        // }
      }
    } else {
      Alert.closeLoadingIndicator();
      Alert.showError(
          title: "Thất bại",
          message: response!.message.toString(),
          buttonText: AppString.CANCEL);
    }
  }

  void countList() {
    count.add(countLessThan4);
    count.add(countForm4ToLessThan55);
    count.add(countForm55ToLessThan7);
    count.add(countFor7ToLessThan85);
    count.add(countGreaterThan85);
  }

  double calculatePercent(double count, double all) {
    return ((count / all) * 100);
  }
}
