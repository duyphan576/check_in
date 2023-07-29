import 'package:check_in/models/grade/grade.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  TableWidget({super.key, required this.grades});
  final List<Grade> grades;
  final TextStyle textStyleBold =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
  final TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 16);
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(color: Colors.white),
        verticalInside: BorderSide(color: Colors.white),
      ),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FixedColumnWidth(70),
        2: FixedColumnWidth(30),
        3: FixedColumnWidth(30),
      },
      children: [
        TableRow(children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              alignment: Alignment.center,
              child: Text("Term", style: textStyleBold),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Text("Attendance Grade", style: textStyleBold),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Text("Exam Grade", style: textStyleBold),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Text("Final Grade", style: textStyleBold),
            ),
          ),
        ]),
        for (int i = 0; i < grades.length; i++)
          TableRow(children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                alignment: Alignment.center,
                child:
                    Text(grades[i].termName.toString(), style: textStyleBold),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(grades[i].attendanceGrade.toString(),
                    style: textStyle),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(grades[i].examGrade.toString(), style: textStyle),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(grades[i].finalGrade.toString(), style: textStyle),
              ),
            ),
          ]),
      ],
    );
  }
}
