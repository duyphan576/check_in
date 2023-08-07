import 'package:check_in/constants/index.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/statistical/models/statistical_model.dart';

import 'package:check_in/modules/statistical/repository/statistical_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';

import 'package:get/get.dart';

RxBool isLoading = true.obs;

class StatisticalController extends GetxController with CacheManager {
  final StatisticalRepository statisticalRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  int countLessThan4 = 0;
  int countForm4ToLessThan55 = 0;
  int countForm55ToLessThan7 = 0;
  int countFor7ToLessThan85 = 0;
  int countGreaterThan85 = 0;
  double countLessThan4Percentage = 0.0;
  double countForm4ToLessThan55Percentage = 0.0;
  double countForm55ToLessThan7Percentage = 0.0;
  double countFor7ToLessThan85Percentage = 0.0;
  double countGreaterThan85Percentage = 0.0;
  List<double?> grades = [];
  Map<String, int> count = {};
  RxBool isLoading = true.obs;

  StatisticalController({required this.statisticalRepository});

  @override
  void onInit() {
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
                title: AppString.ERROR,
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
        countLessThan4Percentage =
            calculatePercent(countLessThan4, grades.length);
        countForm4ToLessThan55Percentage =
            calculatePercent(countForm4ToLessThan55, grades.length);
        countForm55ToLessThan7Percentage =
            calculatePercent(countForm55ToLessThan7, grades.length);
        countFor7ToLessThan85Percentage =
            calculatePercent(countFor7ToLessThan85, grades.length);
        countGreaterThan85Percentage =
            calculatePercent(countGreaterThan85, grades.length);
        update();
        isLoading.value = false;
      }
    } else {
      Alert.closeLoadingIndicator();
      Alert.showError(
              title: AppString.ERROR,
              message: response!.message.toString(),
              buttonText: AppString.CANCEL)
          .then((value) => Alert.closeLoadingIndicator());
    }
  }

  void countList() {
    count["countLessThan4"] = countLessThan4;
    count["countForm4ToLessThan55"] = countForm4ToLessThan55;
    count["countForm55ToLessThan7"] = countForm55ToLessThan7;
    count["countFor7ToLessThan85"] = countFor7ToLessThan85;
    count["countGreaterThan85"] = countGreaterThan85;
  }

  double calculatePercent(int count, int all) {
    return ((count / all) * 100);
  }
}
