import 'package:check_in/constants/app_string.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PeiChartWidget extends StatelessWidget {
  PeiChartWidget({
    super.key,
    required this.countLessThan5,
    required this.countForm5To7,
    required this.countForm7ToLessThan10,
    required this.countEqual10,
    required this.pieAnouce1,
    required this.pieAnouce2,
  });
  double countLessThan5;
  double countForm5To7;
  double countForm7ToLessThan10;
  double countEqual10;
  String pieAnouce1;
  String pieAnouce2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width / 1.7,
          width: MediaQuery.of(context).size.width / 1.8,
          child: PieChart(
            PieChartData(
                centerSpaceRadius: 4,
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 2,
                sections: [
                  PieChartSectionData(
                      value: double.parse(countLessThan5.toString()),
                      showTitle: true,
                      title: "${countLessThan5.toStringAsFixed(2)}%",
                      radius: 115,
                      color: Colors.red),
                  PieChartSectionData(
                      value: double.parse(countForm5To7.toString()),
                      showTitle: true,
                      title: "${countForm5To7.toStringAsFixed(2)}%",
                      radius: 115,
                      color: Colors.yellow),
                  PieChartSectionData(
                      value: double.parse(countForm7ToLessThan10.toString()),
                      showTitle: true,
                      title: "${countForm7ToLessThan10.toStringAsFixed(2)}%",
                      radius: 115,
                      color: Colors.green),
                  PieChartSectionData(
                      value: double.parse(countEqual10.toString()),
                      showTitle: true,
                      title: "${countEqual10.toStringAsFixed(2)}%",
                      radius: 115,
                      color: Colors.pink),
                ]),
          ),
        ),
        GlobalStyles.sizedBoxHeight_25,
        Text(
          pieAnouce1,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        Text(
          pieAnouce2,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        GlobalStyles.sizedBoxHeight_25,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pie chart annotation :",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            GlobalStyles.sizedBoxHeight_10,
            countLessThan5 != 0
                ? TextWidget(
                    color: Colors.red, titleStr: "Percentage score less than 5")
                : Container(),
            GlobalStyles.sizedBoxHeight_10,
            countForm5To7 != 0
                ? TextWidget(
                    color: Colors.yellow,
                    titleStr: "Score percentage from 5 to less than 7")
                : Container(),
            GlobalStyles.sizedBoxHeight_10,
            countForm7ToLessThan10 != 0
                ? TextWidget(
                    color: Colors.green,
                    titleStr: "Score percentage from 7 to less than 10")
                : Container(),
            GlobalStyles.sizedBoxHeight_10,
            countEqual10 != 0
                ? TextWidget(
                    color: Colors.pink, titleStr: "Point percentage equals 10")
                : Container(),
          ],
        ),
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.color, required this.titleStr});
  final Color color;
  final String titleStr;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Icon(
          Icons.pie_chart,
          color: color,
        ),
        GlobalStyles.sizedBoxWidth,
        Text(
          titleStr,
          style: TextStyle(color: Colors.white),
        ),
      ]),
    );
  }
}
