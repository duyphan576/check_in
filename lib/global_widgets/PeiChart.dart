import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PeiChartWidget extends StatelessWidget {
  PeiChartWidget({
    super.key,
    required this.countLessThan5,
    required this.countForm5To7,
    required this.countForm7ToLessThan10,
    required this.countEqual10,
  });
  double countLessThan5;
  double countForm5To7;
  double countForm7ToLessThan10;
  double countEqual10;
  @override
  Widget build(BuildContext context) {
    return PieChart(
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
    );
  }
}
