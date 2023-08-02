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
    required this.pieAnouce,
  });
  double countLessThan4Percentage;
  double countForm4ToLessThan55Percentage;
  double countForm55ToLessThan7Percentage;
  double countFor7ToLessThan85Percentage;
  double countGreaterThan85Percentage;
  List<double> count;
  String pieAnouce;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width / 1.1,
          width: MediaQuery.of(context).size.width / 1.1,
          child: PieChart(
            PieChartData(
                centerSpaceRadius: 5,
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 2,
                sections: [
                  PieChartSectionData(
                      value: double.parse(countLessThan4Percentage.toString()),
                      showTitle: true,
                      title:
                          "${countLessThan4Percentage.toStringAsFixed(2)}% - ${count[0]}",
                      radius: 170,
                      titlePositionPercentageOffset: 0.6,
                      color: Colors.red),
                  PieChartSectionData(
                      value: double.parse(
                          countForm4ToLessThan55Percentage.toString()),
                      showTitle: true,
                      title:
                          "${countForm4ToLessThan55Percentage.toStringAsFixed(2)}% - ${count[1]}",
                      radius: 170,
                      titlePositionPercentageOffset: 0.6,
                      color: Colors.orange),
                  PieChartSectionData(
                      value: double.parse(
                          countForm55ToLessThan7Percentage.toString()),
                      showTitle: true,
                      title:
                          "${countForm55ToLessThan7Percentage.toStringAsFixed(2)}% - ${count[2]}",
                      titlePositionPercentageOffset: 0.6,
                      radius: 170,
                      color: Colors.yellow),
                  PieChartSectionData(
                      value: double.parse(
                          countFor7ToLessThan85Percentage.toString()),
                      showTitle: true,
                      titlePositionPercentageOffset: 0.6,
                      title:
                          "${countFor7ToLessThan85Percentage.toStringAsFixed(2)}% - ${count[3]}",
                      radius: 170,
                      color: Colors.green),
                  PieChartSectionData(
                      value:
                          double.parse(countGreaterThan85Percentage.toString()),
                      showTitle: true,
                      titlePositionPercentageOffset: 0.6,
                      title:
                          "${countGreaterThan85Percentage.toStringAsFixed(2)}% - ${count[4]}",
                      radius: 170,
                      color: Colors.pink.shade300),
                ]),
          ),
        ),
        GlobalStyles.sizedBoxHeight_25,
        Text(
          pieAnouce,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        GlobalStyles.sizedBoxHeight_25,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chú thích biểu đồ hình tròn :",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            GlobalStyles.sizedBoxHeight_10,
            countLessThan4Percentage != 0
                ? TextWidget(
                    color: Colors.red, titleStr: "Tỷ lệ phần trăm điểm dưới 4")
                : Container(),
            GlobalStyles.sizedBoxHeight_10,
            countForm4ToLessThan55Percentage != 0
                ? TextWidget(
                    color: Colors.orange,
                    titleStr: "Tỷ lệ phần trăm điểm từ 4 đến dưới 5,5")
                : Container(),
            GlobalStyles.sizedBoxHeight_10,
            countForm55ToLessThan7Percentage != 0
                ? TextWidget(
                    color: Colors.yellow,
                    titleStr: "Tỷ lệ phần trăm điểm từ 5,5 đến dưới 7")
                : Container(),
            GlobalStyles.sizedBoxHeight_10,
            countFor7ToLessThan85Percentage != 0
                ? TextWidget(
                    color: Colors.green,
                    titleStr: "Tỷ lệ phần trăm điểm từ 7 đến dưới 8,5")
                : Container(),
            countGreaterThan85Percentage != 0
                ? TextWidget(
                    color: Colors.pink.shade300,
                    titleStr: "Tỷ lệ phần trăm điểm lớn hơn 8,5")
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
          style: TextStyle(color: Colors.black),
        ),
      ]),
    );
  }
}
