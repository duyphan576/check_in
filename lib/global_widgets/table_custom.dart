// ignore_for_file: must_be_immutable

import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/constants/app_string.dart';
import 'package:check_in/modules/grade/controllers/grade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class TableCustom extends GetView<GradeController> {
  TableCustom({Key? key}) : super(key: key);

  TextStyle textStyleBold = TextStyle(
    color: AppColors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  TextStyle textStyle = TextStyle(
    color: AppColors.black,
    fontSize: 12,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: HorizontalDataTable(
          leftHandSideColumnWidth: 120,
          rightHandSideColumnWidth: 475,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: controller.grades.length,
          rowSeparatorWidget: Divider(
            color: AppColors.subMain,
            height: 1.0,
            thickness: 0.0,
          ),
          leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
          rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
          onScrollControllerReady: (vertical, horizontal) {
            controller.verticalScrollController = vertical;
            controller.horizontalScrollController = horizontal;
          },
          verticalScrollbarStyle: const ScrollbarStyle(
            thumbColor: Colors.grey,
            thickness: 1.0,
            radius: Radius.circular(5.0),
          ),
          horizontalScrollbarStyle: const ScrollbarStyle(
            thumbColor: Colors.grey,
            thickness: 1.0,
            radius: Radius.circular(5.0),
          ),
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget(GradeString.TERM, 120),
      _getTitleItemWidget(GradeString.A_GRADE, 120),
      _getTitleItemWidget(GradeString.C1_GRADE, 95),
      _getTitleItemWidget(GradeString.C2_GRADE, 95),
      _getTitleItemWidget(GradeString.E_GRADE, 65),
      _getTitleItemWidget(GradeString.F_GRADE, 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 50,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 120,
      height: 50,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(controller.grades[index].termName.toString()),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 120,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child:
              Text("${isNull(controller.grades[index].attendance.toString())}"),
        ),
        Container(
          width: 95,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(
              "${isNull(controller.grades[index].coefficient1Exam1.toString())}  ${isNull(controller.grades[index].coefficient1Exam2.toString())}  ${isNull(controller.grades[index].coefficient1Exam3.toString())}"),
        ),
        Container(
          width: 95,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text(
              "${isNull(controller.grades[index].coefficient2Exam1.toString())}  ${isNull(controller.grades[index].coefficient2Exam2.toString())}"),
        ),
        Container(
          width: 65,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Text("${isNull(controller.grades[index].exam.toString())}"),
        ),
        Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child:
              Text("${isNull(controller.grades[index].finalGrade.toString())}"),
        ),
      ],
    );
  }
}

String isNull(String grade) {
  if (grade == "null") {
    return '';
  }
  return grade;
}
