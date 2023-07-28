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
  int ClassroomId = int.parse(Get.parameters['classroomId'].toString());
  bool isClassroom = "true" == Get.parameters['isClassroom'].toString();
  RxList<double?> grades =
      <double?>[].obs; // Change the type to RxList<double?>
  var countLessThan5 = 0.0;
  var countForm5To7 = 0.0;
  var countForm7ToLessThan10 = 0.0;
  var countEqual10 = 0.0;
  RxBool isLoading = true.obs;
  List<BarChartGroupData> barGroups = [];
  StatisticalController({required this.statisticalRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(isClassroom);

    getGradesData();
  }

  void getGradesData() async {
    isLoading.value = true;
    final response = await statisticalRepository.statistical(
      StatisticalModel(classroomId: ClassroomId.toString()),
      UrlProvider.HANDLES_GRADELISTCLASS,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      List<dynamic> gradeList = response?.data['examGradeList'];
      print(response?.data['examGradeList'].isEmpty);
      if (response?.data['examGradeList'].isEmpty) {
        Alert.closeLoadingIndicator();
        Alert.showSuccess(
            title: "Error",
            message: StatisticalString.GradesEmpty,
            buttonText: AppString.CANCEL);
      } else {
        List<double?> gradesList = gradeList.map((dynamic item) {
          if (item is int) {
            return item.toDouble(); // Convert to double
          } else if (item is double) {
            return item;
          } else {
            return null;
          }
        }).toList();
        grades.addAll(gradesList);
        update();
        print(grades);
        for (int i = 0; i < grades.length; i++) {
          if (grades[i]! < 5) {
            countLessThan5++;
          } else if (grades[i]! >= 5 && grades[i]! < 7) {
            countForm5To7++;
          } else if (grades[i]! >= 7 && grades[i]! < 10) {
            countForm7ToLessThan10++;
          } else if (grades[i] == 10) {
            countEqual10++;
          }
        }
        countLessThan5 = CalculatePercent(
            countLessThan5, double.parse(grades.length.toString()));
        countForm5To7 = CalculatePercent(
            countForm5To7, double.parse(grades.length.toString()));
        countForm7ToLessThan10 = CalculatePercent(
            countForm7ToLessThan10, double.parse(grades.length.toString()));
        countEqual10 = CalculatePercent(
            countEqual10, double.parse(grades.length.toString()));
        Map<int, int> occurrences = countOccurrences(grades);
        for (var grade in occurrences.keys) {
          int count = occurrences[grade] ?? 0;
          BarChartGroupData barGroup = BarChartGroupData(
            x: grade,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: count.toDouble(), // Convert to double
                width: 15,
                color: Colors.amber,
              ),
            ],
          );
          barGroups.add(barGroup);
          isLoading.value = false;
        }
      }
    } else {
      Alert.closeLoadingIndicator();
      Alert.showSuccess(
          title: "Error",
          message: response!.message.toString(),
          buttonText: AppString.CANCEL);
    }
  }

  Map<int, int> countOccurrences(List<double?> grades) {
    Map<int, int> occurrences = {};

    for (int i = 0; i <= 10; i++) {
      occurrences[i] = 0;
    }

    for (double? grade in grades) {
      if (grade != null && grade >= 0 && grade <= 10) {
        occurrences[grade.toInt()] =
            (occurrences[grade.toInt()] ?? 0) + 1; // Convert to int
      }
    }

    return occurrences;
  }

  double CalculatePercent(double count, double all) {
    return ((count / all) * 100);
  }
}
