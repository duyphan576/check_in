import 'package:check_in/constants/index.dart';
import 'package:check_in/core/index.dart';
import 'package:check_in/modules/grade/models/grade_models.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/grade/grade.dart';
import '../repository/grade_repository.dart';

class GradeController extends GetxController with CacheManager {
  final GradeRepository gradeRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  ScrollController? verticalScrollController;
  ScrollController? horizontalScrollController;
  var userData;
  RxBool isLoading = true.obs;
  var avgGrade;
  List<double> gradeFinalList = [];
  RxList<Grade> grades = <Grade>[].obs;
  double? gradeFinal;
  bool isGradeFinalNull = true;
  List<double> count = [];
  List<BarChartGroupData> barGroups = [];
  GradeController({required this.gradeRepository});
  var countLessThan4 = 0.0;
  var countForm4ToLessThan55 = 0.0;
  var countForm55ToLessThan7 = 0.0;
  var countFor7ToLessThan85 = 0.0;
  var countGreaterThan85 = 0.0;

  @override
  void onInit() async {
    super.onInit();
    initData();
    getGradesData();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = true;
    }
  }

  Future<void> getGradesData() async {
    final response = await gradeRepository.grade(
      GradeModel(),
      UrlProvider.HANDLES_GRADE,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      List<dynamic> gradeList = response?.data['grades'];
      avgGrade = response?.data['avgGrade'];
      List<Grade> gradesData =
          gradeList.map((json) => Grade.fromJson(json)).toList();

      grades.addAll(gradesData);
      for (int i = 0; i < grades.length; i++) {
        if (grades[i].finalGrade.toString().trim() == "null") {
          continue;
        }
        gradeFinal = double.parse(grades[i].finalGrade.toString().trim());
        gradeFinalList.add(gradeFinal!);
      }
      if (gradeFinalList.isEmpty) {
        isGradeFinalNull = false;
      }
      if (isGradeFinalNull) {
        for (int i = 0; i < gradeFinalList.length; i++) {
          if (gradeFinalList[i] < 4) {
            countLessThan4++;
          } else if (gradeFinalList[i] >= 4 && gradeFinalList[i] < 5.5) {
            countForm4ToLessThan55++;
          } else if (gradeFinalList[i] >= 5.5 && gradeFinalList[i] < 7) {
            countForm55ToLessThan7++;
          } else if (gradeFinalList[i] >= 7 && gradeFinalList[i] < 8.5) {
            countFor7ToLessThan85++;
          } else if (gradeFinalList[i] >= 8.5) {
            countGreaterThan85++;
          }
        }
        countList();
        for (int i = 0; i < count.length; i++) {
          BarChartGroupData barGroup = BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                fromY: 0,
                toY: count[i].toDouble(),
                width: 15,
                color: Colors.amber,
              ),
            ],
          );
          barGroups.add(barGroup);
        }
      }
      update();
      isLoading.value = false;
    } else {
      Alert.showError(
              title: AppString.ERROR,
              buttonText: AppString.CANCEL,
              message: response!.message.toString())
          .then((value) => Alert.closeLoadingIndicator());
    }
  }

  void countList() {
    count.add(countLessThan4);
    count.add(countForm4ToLessThan55);
    count.add(countForm55ToLessThan7);
    count.add(countFor7ToLessThan85);
    count.add(countGreaterThan85);
  }
}
