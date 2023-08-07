// ignore_for_file: must_be_immutable

import 'package:check_in/constants/app_string.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PeiChartWidget extends StatelessWidget {
  PeiChartWidget({
    super.key,
    required this.countLessThan4Percentage,
    required this.countForm4ToLessThan55Percentage,
    required this.countForm55ToLessThan7Percentage,
    required this.countFor7ToLessThan85Percentage,
    required this.countGreaterThan85Percentage,
    required this.count,
  });
  double countLessThan4Percentage;
  double countForm4ToLessThan55Percentage;
  double countForm55ToLessThan7Percentage;
  double countFor7ToLessThan85Percentage;
  double countGreaterThan85Percentage;
  Map<String, int> count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StatisticalString.PIE_CHART,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        GlobalStyles.sizedBoxHeight_25,
        Container(
          height: MediaQuery.of(context).size.width / 1.1,
          width: MediaQuery.of(context).size.width / 1.1,
          child: PieChart(
            PieChartData(
                centerSpaceRadius: 5,
                borderData: FlBorderData(
                  show: true,
                ),
                sectionsSpace: 2,
                sections: [
                  PieChartSectionData(
                      value: countLessThan4Percentage,
                      showTitle: true,
                      title:
                          "${countLessThan4Percentage.toStringAsFixed(2)}% - ${count['countLessThan4']}",
                      radius: 170,
                      titlePositionPercentageOffset: 0.6,
                      color: Colors.red),
                  PieChartSectionData(
                      value: countForm4ToLessThan55Percentage,
                      showTitle: true,
                      title:
                          "${countForm4ToLessThan55Percentage.toStringAsFixed(2)}% - ${count['countForm4ToLessThan55']}",
                      radius: 170,
                      titlePositionPercentageOffset: 0.6,
                      color: Colors.orange),
                  PieChartSectionData(
                      value: countForm55ToLessThan7Percentage,
                      showTitle: true,
                      title:
                          "${countForm55ToLessThan7Percentage.toStringAsFixed(2)}% - ${count['countForm55ToLessThan7']}",
                      titlePositionPercentageOffset: 0.6,
                      radius: 170,
                      color: Colors.yellow),
                  PieChartSectionData(
                      value: countFor7ToLessThan85Percentage,
                      showTitle: true,
                      titlePositionPercentageOffset: 0.6,
                      title:
                          "${countFor7ToLessThan85Percentage.toStringAsFixed(2)}% - ${count['countFor7ToLessThan85']}",
                      radius: 170,
                      color: Colors.green),
                  PieChartSectionData(
                      value: countGreaterThan85Percentage,
                      showTitle: true,
                      titlePositionPercentageOffset: 0.6,
                      title:
                          "${countGreaterThan85Percentage.toStringAsFixed(2)}% - ${count['countGreaterThan85']}",
                      radius: 170,
                      color: Colors.pink.shade300),
                ]),
          ),
        ),
        GlobalStyles.sizedBoxHeight_25,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StatisticalString.PEI_ANOUNCE,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            GlobalStyles.sizedBoxHeight_10,
            countLessThan4Percentage != 0
                ? TextWidget(
                    color: Colors.red, titleStr: StatisticalString.PEI_GRADE_1)
                : Container(),
            countForm4ToLessThan55Percentage != 0
                ? TextWidget(
                    color: Colors.orange,
                    titleStr: StatisticalString.PEI_GRADE_2)
                : Container(),
            countForm55ToLessThan7Percentage != 0
                ? TextWidget(
                    color: Colors.yellow,
                    titleStr: StatisticalString.PEI_GRADE_3)
                : Container(),
            countFor7ToLessThan85Percentage != 0
                ? TextWidget(
                    color: Colors.green,
                    titleStr: StatisticalString.PEI_GRADE_4)
                : Container(),
            countGreaterThan85Percentage != 0
                ? TextWidget(
                    color: Colors.pink.shade300,
                    titleStr: StatisticalString.PEI_GRADE_5)
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
      child: Column(
        children: [
          Row(children: [
            Icon(
              Icons.pie_chart,
              color: color,
            ),
            GlobalStyles.sizedBoxWidth,
            Text(
              titleStr,
              style: TextStyle(color: Colors.black),
            ),
          ]),
          GlobalStyles.sizedBoxHeight_10,
        ],
      ),
    );
  }
}
