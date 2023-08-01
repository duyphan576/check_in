import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/constants/index.dart';
import 'package:check_in/models/grade/grade.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  TableWidget({super.key, required this.grades});
  final List<Grade> grades;
  final TextStyle textStyleBold = TextStyle(
      color: AppColors.black, fontSize: 12, fontWeight: FontWeight.bold);
  final TextStyle textStyle = TextStyle(color: AppColors.black, fontSize: 12);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.black),
            verticalInside: BorderSide(color: Colors.black),
          ),
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: IntrinsicColumnWidth(),
            2: IntrinsicColumnWidth(),
            3: IntrinsicColumnWidth(),
            4: IntrinsicColumnWidth(),
            5: IntrinsicColumnWidth(),
          },
          children: [
            TableRow(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      GradeString.TERM,
                      style: textStyleBold,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      GradeString.A_GRADE,
                      style: textStyleBold,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      GradeString.C1_GRADE,
                      style: textStyleBold,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(GradeString.C2_GRADE, style: textStyleBold),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(GradeString.E_GRADE, style: textStyleBold),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(GradeString.F_GRADE, style: textStyleBold),
                  ),
                ),
              ],
            ),
            for (int i = 0; i < grades.length; i++)
              TableRow(children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child:
                        Text(grades[i].termName.toString(), style: textStyle),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child:
                        Text(grades[i].attendance.toString(), style: textStyle),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                        "${grades[i].coefficient1Exam1.toString()}   ${grades[i].coefficient1Exam2.toString()}   ${grades[i].coefficient1Exam3.toString()}",
                        style: textStyle),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                        "${grades[i].coefficient2Exam1.toString()}   ${grades[i].coefficient2Exam2.toString()}",
                        style: textStyle),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(grades[i].exam.toString(), style: textStyle),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child:
                        Text(grades[i].finalGrade.toString(), style: textStyle),
                  ),
                ),
              ]),
          ],
        ),
      ),
    );
  }
}
