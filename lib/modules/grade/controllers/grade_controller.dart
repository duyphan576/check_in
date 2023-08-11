import 'package:check_in/constants/index.dart';
import 'package:check_in/core/index.dart';
import 'package:check_in/global_widgets/header_container.dart';
import 'package:check_in/modules/grade/models/grade_models.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/grade/grade_detail_model.dart';
import '../repository/grade_repository.dart';

class GradeController extends GetxController with CacheManager {
  final GradeRepository gradeRepository;
  var userData;
  RxBool isLoading = true.obs;
  var param;
  GradeController({required this.gradeRepository});

  RxList<GradeModel> listGrade = <GradeModel>[].obs;
  RxList<GradeDetailModel> listGradeDetail = <GradeDetailModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    initData();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = true;
    }
    param = Get.arguments;
    if (param != null) {}
    getGradesData();
  }

  Future<void> getGradesData() async {
    final response = await gradeRepository.grade(
      GradeModel(),
      UrlProvider.HANDLES_GRADE,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      final List _listRequest = response?.data;
      if (_listRequest.isNotEmpty) {
        listGrade.value =
            _listRequest.map((value) => GradeModel.fromJson(value)).toList();
      }
      update();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      Alert.showError(
        title: AppString.ERROR,
        buttonText: AppString.CANCEL,
        message: response!.message.toString(),
      );
    }
  }

  getListHeaderTitle(context) {
    List<Widget> headerList = [];
    headerList.add(
      Container(
        width: 150,
        height: 80,
        child: Text(
          GradeString.NAME_TERM,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.subMain,
            fontSize: 14.0,
          ),
          textScaleFactor: 1.0,
        ),
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
      ),
    );
    headerList.add(
      HeaderContainer(
        text: GradeString.ATTENDANCE,
        width: 50,
        height: 80,
      ),
    );
    headerList.add(
      SubHeaderHS1(),
    );
    headerList.add(
      SubHeaderHS2(),
    );
    headerList.add(
      HeaderContainer(
        text: GradeString.EXAM,
        width: 50,
        height: 80,
      ),
    );
    headerList.add(
      HeaderContainer(
        text: GradeString.FINAL,
        width: 50,
        height: 80,
      ),
    );
    headerList.add(
      HeaderContainer(
        text: GradeString.GPA_10,
        width: 50,
        height: 80,
      ),
    );
    headerList.add(
      HeaderContainer(
        text: GradeString.GPA_4,
        width: 50,
        height: 80,
      ),
    );
    headerList.add(
      HeaderContainer(
        text: GradeString.GPA_CH,
        width: 50,
        height: 80,
      ),
    );
    headerList.add(
      HeaderContainer(
        text: GradeString.RESULT,
        width: 100,
        height: 80,
      ),
    );

    return headerList;
  }

  generateRightHandSideColumnRow(GradeDetailModel item) {
    List<Widget> detailList = [];

    detailList.add(
      _container(
        text: item.attendance,
        width: 50,
        alignment: Alignment.center,
      ),
    );
    detailList.add(
      _container(
        text: item.coefficient1Exam1,
        width: 50,
        alignment: Alignment.center,
      ),
    );
    detailList.add(
      _container(
        text: item.coefficient2Exam1,
        width: 50,
        alignment: Alignment.center,
      ),
    );
    detailList.add(
      _container(
          text: item.coefficient3Exam1, width: 50, alignment: Alignment.center),
    );
    detailList.add(
      _container(
          text: item.coefficient1Exam2, width: 50, alignment: Alignment.center),
    );
    detailList.add(
      _container(
          text: item.coefficient2Exam2, width: 50, alignment: Alignment.center),
    );
    detailList.add(
      _container(
        text: item.exam,
        width: 50,
        alignment: Alignment.center,
      ),
    );
    detailList.add(
      _container(
        text: item.finalGrade,
        width: 50,
        alignment: Alignment.center,
      ),
    );
    detailList.add(
      _container(
        text: item.gpa10 ?? "",
        width: 50,
        alignment: Alignment.center,
      ),
    );
    detailList.add(
      _container(
        text: item.gpa4,
        width: 50,
        alignment: Alignment.center,
      ),
    );
    detailList.add(
      _container(
        text: item.gbaCH,
        width: 50,
        alignment: Alignment.center,
      ),
    );
    detailList.add(
      _container(
        text: item.result,
        width: 100,
        alignment: Alignment.center,
      ),
    );
    return detailList;
  }

  Widget _container({
    String? text,
    double? width,
    Alignment? alignment,
    Color? colorText,
    Color? background,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: background ?? Colors.white,
          border: Border(
            left: BorderSide(
              color: Colors.grey.shade200,
            ),
          )),
      child: Text(
        text ?? "",
        style: TextStyle(
          fontSize: 14.0,
          overflow: TextOverflow.ellipsis,
          color: colorText ?? AppColors.black,
        ),
        maxLines: 4,
        textScaleFactor: 1.0,
      ),
      width: width ?? 150,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: alignment ?? Alignment.centerLeft,
    );
  }
}
