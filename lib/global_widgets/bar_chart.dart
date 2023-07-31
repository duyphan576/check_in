import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  BarChartWidget(
      {super.key, required this.gradesLength, required this.barGroupsList});
  double gradesLength;
  List<BarChartGroupData> barGroupsList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 1.2,
      width: MediaQuery.of(context).size.width / 1.2,
      child: AspectRatio(
        aspectRatio: 1,
        child: BarChart(
          BarChartData(
              minY: 0,
              maxY: gradesLength < 7 ? 7 : gradesLength,
              titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int xvalue = value.toInt();
                      print(xvalue);
                      if (xvalue == 0) {
                        return Text(
                          "F",
                          style: TextStyle(color: Colors.white),
                        );
                      } else if (xvalue == 1) {
                        return Text(
                          "D",
                          style: TextStyle(color: Colors.white),
                        );
                      } else if (xvalue == 2) {
                        return Text(
                          "C",
                          style: TextStyle(color: Colors.white),
                        );
                      } else if (xvalue == 3) {
                        return Text(
                          "B",
                          style: TextStyle(color: Colors.white),
                        );
                      } else if (xvalue == 4) {
                        return Text(
                          "A",
                          style: TextStyle(color: Colors.white),
                        );
                      }
                      return Text(
                        xvalue.toInt().toString(),
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  )),
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  )),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false))),
              borderData: FlBorderData(
                border: Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.white,
                    )),
              ),
              barGroups: barGroupsList),
        ),
      ),
    );
  }
}
