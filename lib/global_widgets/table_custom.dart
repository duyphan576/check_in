import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/models/grade/grade.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  TableWidget({Key? key, required this.grades}) : super(key: key);

  final List<Grade> grades;

  TextStyle textStyleBold = TextStyle(
      color: AppColors.black, fontSize: 12, fontWeight: FontWeight.bold);
  TextStyle textStyle = TextStyle(color: AppColors.black, fontSize: 12);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: TableBorder(
            verticalInside: BorderSide(color: Colors.grey.shade300),
            bottom: BorderSide(color: Colors.grey.shade300)),
        columnSpacing: 30,
        headingRowHeight: 40,
        dataRowHeight: 40,
        horizontalMargin: 10,
        columns: [
          DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: Text("Môn học", style: textStyleBold),
            ),
          ),
          DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: Text("Điểm chuyên cần", style: textStyleBold),
            ),
          ),
          DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: Text("Điểm hệ số 1", style: textStyleBold),
            ),
          ),
          DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: Text("Điểm hệ số 2", style: textStyleBold),
            ),
          ),
          DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: Text("Điểm thi", style: textStyleBold),
            ),
          ),
          DataColumn(
            label: Container(
              alignment: Alignment.center,
              child: Text("Điểm quá trình", style: textStyleBold),
            ),
          ),
        ],
        rows: [
          for (int i = 0; i < grades.length; i++)
            DataRow(cells: [
              DataCell(
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(grades[i].termName.toString(), style: textStyle),
                ),
              ),
              DataCell(
                Container(
                  alignment: Alignment.center,
                  child: Text(isNull(grades[i].attendance.toString()),
                      style: textStyle),
                ),
              ),
              DataCell(
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    isNull(grades[i].coefficient1Exam1.toString()) +
                        "   " +
                        isNull(grades[i].coefficient1Exam2.toString()) +
                        "   " +
                        isNull(grades[i].coefficient1Exam3.toString()),
                    style: textStyle,
                  ),
                ),
              ),
              DataCell(
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    isNull(grades[i].coefficient2Exam1.toString()) +
                        "   " +
                        isNull(grades[i].coefficient2Exam2.toString()),
                    style: textStyle,
                  ),
                ),
              ),
              DataCell(
                Container(
                  alignment: Alignment.center,
                  child:
                      Text(isNull(grades[i].exam.toString()), style: textStyle),
                ),
              ),
              DataCell(
                Container(
                  alignment: Alignment.center,
                  child: Text(isNull(grades[i].finalGrade.toString()),
                      style: textStyle),
                ),
              ),
            ]),
        ],
      ),
    );
  }
}

String isNull(String grade) {
  if (grade == "null") {
    return '';
  }
  return grade;
}
