import 'package:check_in/constants/index.dart';
import 'package:check_in/core/index.dart';
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
    getGradesData();
  }

  Future<void> getGradesData() async {
    final response = await gradeRepository.grade(
      GradeModel(),
      UrlProvider.HANDLES_GRADE,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (/*response?.status == 1*/ true) {
      final List _listRequest = json /*response!.data*/;
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
          message: response!.message.toString());
    }
  }

  getListHeaderTitle(context) {
    List<Widget> headerList = [];
    headerList.add(Container(
      width: 150,
      height: 80,
      child: Text(
        GradeString.NAME_TERM,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
        textScaleFactor: 1.0,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade200)),
      ),
    ));
    headerList.add(Container(
      width: 50,
      height: 80,
      child: Text(
        GradeString.ATTENDANCE,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
        textScaleFactor: 1.0,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    ));
    headerList.add(Container(
      width: 150,
      height: 80,
      child: Column(
        children: [
          Container(
            child: Text(
              GradeString.COEFFICIENT_1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 16.0),
              textScaleFactor: 1.0,
            ),
            width: 150,
            height: 40,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.grey.shade200),
                  bottom: BorderSide(color: Colors.grey.shade200)),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    GradeString.ONE,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16.0),
                    textScaleFactor: 1.0,
                  ),
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(color: Colors.grey.shade200)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    GradeString.TWO,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16.0),
                    textScaleFactor: 1.0,
                  ),
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(color: Colors.grey.shade200)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    GradeString.THREE,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16.0),
                    textScaleFactor: 1.0,
                  ),
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(color: Colors.grey.shade200)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
    headerList.add(Container(
      width: 100,
      height: 80,
      child: Column(
        children: [
          Container(
            child: Text(
              GradeString.COEFFICIENT_2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 16.0),
              textScaleFactor: 1.0,
            ),
            width: 100,
            height: 40,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.grey.shade200),
                  bottom: BorderSide(color: Colors.grey.shade200)),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    GradeString.ONE,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16.0),
                    textScaleFactor: 1.0,
                  ),
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(color: Colors.grey.shade200)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    GradeString.TWO,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16.0),
                    textScaleFactor: 1.0,
                  ),
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(color: Colors.grey.shade200)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
    headerList.add(Container(
      width: 50,
      height: 80,
      child: Text(
        GradeString.EXAM,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
        textScaleFactor: 1.0,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade200)),
      ),
    ));
    headerList.add(Container(
      width: 50,
      height: 80,
      child: Text(
        GradeString.FINAL,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
        textScaleFactor: 1.0,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade200)),
      ),
    ));
    headerList.add(Container(
      width: 50,
      height: 80,
      child: Text(
        GradeString.GPA_10,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
        textScaleFactor: 1.0,
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade200)),
      ),
    ));
    headerList.add(Container(
      width: 50,
      height: 80,
      child: Text(
        GradeString.GPA_4,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
        textScaleFactor: 1.0,
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade200)),
      ),
    ));
    headerList.add(Container(
      width: 50,
      height: 80,
      child: Text(
        GradeString.GPA_CH,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
        textScaleFactor: 1.0,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade200)),
      ),
    ));
    headerList.add(Container(
      width: 100,
      height: 80,
      child: Text(
        GradeString.RESULT,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16.0),
        textScaleFactor: 1.0,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey.shade200)),
      ),
    ));

    return headerList;
  }

  generateRightHandSideColumnRow(GradeDetailModel item) {
    List<Widget> detailList = [];

    detailList.add(
      _container(
        text: item.attendance,
        width: 50,
        alignment: Alignment.centerRight,
      ),
    );
    detailList.add(
      _container(
        text: item.coefficient1Exam1,
        width: 50,
        alignment: Alignment.centerRight,
      ),
    );
    detailList.add(
      _container(
        text: item.coefficient1Exam2,
        width: 50,
        alignment: Alignment.centerRight,
      ),
    );
    detailList.add(
      _container(
          text: item.coefficient1Exam3,
          width: 50,
          alignment: Alignment.centerRight),
    );
    detailList.add(
      _container(
          text: item.coefficient2Exam1,
          width: 50,
          alignment: Alignment.centerRight),
    );
    detailList.add(
      _container(
          text: item.coefficient2Exam2,
          width: 50,
          alignment: Alignment.centerRight),
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
        alignment: Alignment.centerRight,
      ),
    );
    detailList.add(
      _container(
        text: item.gpa10 ?? "",
        width: 50,
        alignment: Alignment.centerRight,
      ),
    );
    detailList.add(
      _container(
        text: item.gpa4,
        width: 50,
        alignment: Alignment.centerRight,
      ),
    );
    detailList.add(
      _container(
        text: item.gbaCH,
        width: 50,
        alignment: Alignment.centerRight,
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

  Widget _container(
      {String? text,
      double? width,
      Alignment? alignment,
      Color? colorText,
      Color? background}) {
    return Container(
      decoration: BoxDecoration(
          color: background ?? Colors.white,
          border: Border(left: BorderSide(color: Colors.grey.shade200))),
      child: Text(
        text ?? "",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
          color: colorText ?? Colors.black,
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

  var json = [
    {
      "idSemester": "1",
      "nameSemester": "Học kỳ 1(NH: 2020 -2021)",
      "semesterGPA10": "8.6",
      "semesterGPA4": "3.7",
      "cumulativeGPA10": "8.2",
      "cumulativeGPA4": "3.36",
      "courseCreditsAchieve": "20",
      "courseCreditsAll": "20",
      "list_grade": [
        {
          "termId": "1",
          "termName": "Lập trình căn bản",
          "attendance": "9.0",
          "coefficient1Exam1": "8.0",
          "coefficient1Exam2": "9.0",
          "coefficient1Exam3": "",
          "coefficient2Exam1": "10.0",
          "coefficient2Exam2": "9.0",
          "exam": "9.5",
          "final": "8.8",
          "gpa10": "8.8",
          "gpa4": "3.7",
          "gbaCH": "A",
          "result": "Đạt"
        },
        {
          "termId": "2",
          "termName": "Thiết kế Web",
          "attendance": "9.0",
          "coefficient1Exam1": "9.0",
          "coefficient1Exam2": "",
          "coefficient1Exam3": "",
          "coefficient2Exam1": "10.0",
          "coefficient2Exam2": "9.0",
          "exam": "9.5",
          "final": "8.8",
          "gpa10": "8.8",
          "gpa4": "3.7",
          "gbaCH": "A",
          "result": "Đạt"
        },
        {
          "termId": "3",
          "termName": "Công nghệ phần mềm",
          "attendance": "9.0",
          "coefficient1Exam1": "10.0",
          "coefficient1Exam2": "9.0",
          "coefficient1Exam3": "",
          "coefficient2Exam1": "10.0",
          "coefficient2Exam2": "9.0",
          "exam": "9.5",
          "final": "8.8",
          "gpa10": "8.8",
          "gpa4": "3.7",
          "gbaCH": "A",
          "result": "Đạt"
        },
      ]
    },
    {
      "idSemester": "2",
      "nameSemester": "Học kỳ 2(NH: 2020 -2021)",
      "semesterGPA10": "8.6",
      "semesterGPA4": "3.7",
      "cumulativeGPA10": "8.2",
      "cumulativeGPA4": "3.36",
      "courseCreditsAchieve": "25",
      "courseCreditsAll": "45",
      "list_grade": [
        {
          "termId": "4",
          "termName": "Lập trình Java",
          "attendance": "9.0",
          "coefficient1Exam1": "8.0",
          "coefficient1Exam2": "",
          "coefficient1Exam3": "",
          "coefficient2Exam1": "10.0",
          "coefficient2Exam2": "",
          "exam": "9.5",
          "final": "8.8",
          "gpa10": "8.8",
          "gpa4": "3.7",
          "gbaCH": "A",
          "result": "Đạt"
        },
        {
          "termId": "5",
          "termName": "Lập trình web",
          "attendance": "9.0",
          "coefficient1Exam1": "8.0",
          "coefficient1Exam2": "",
          "coefficient1Exam3": "",
          "coefficient2Exam1": "10.0",
          "coefficient2Exam2": "",
          "exam": "9.5",
          "final": "8.8",
          "gpa10": "8.8",
          "gpa4": "3.7",
          "gbaCH": "A",
          "result": "Đạt"
        },
        {
          "termId": "6",
          "termName": "Lập trình thiết bị di động",
          "attendance": "9.0",
          "coefficient1Exam1": "8.0",
          "coefficient1Exam2": "7.0",
          "coefficient1Exam3": "",
          "coefficient2Exam1": "7.0",
          "coefficient2Exam2": "",
          "exam": "",
          "final": "",
          "gpa10": "",
          "gpa4": "",
          "gbaCH": "",
          "result": ""
        }
      ]
    },
    {
      "idSemester": "3",
      "nameSemester": "Học kỳ 1(NH: 2021 -2022)",
      "semesterGPA10": "",
      "semesterGPA4": "",
      "cumulativeGPA10": "",
      "cumulativeGPA4": "",
      "courseCreditsAchieve": "",
      "courseCreditsAll": "45",
      "list_grade": []
    }
  ];
}
