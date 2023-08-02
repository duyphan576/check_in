import 'package:check_in/constants/app_string.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global_styles/global_styles.dart';

class BarChartWidget extends StatelessWidget {
  BarChartWidget(
      {super.key, required this.gradesLength, required this.barGroupsList});
  double gradesLength;
  List<BarChartGroupData> barGroupsList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 150,
                child: Text(StatisticalString.BAR_CHART,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              GlobalStyles.sizedBoxWidth,
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close)),
            ],
          ),
          GlobalStyles.sizedBoxHeight_25,
          Container(
            width: MediaQuery.of(context).size.width,
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
                                style: TextStyle(color: Colors.black),
                              );
                            } else if (xvalue == 1) {
                              return Text(
                                "D",
                                style: TextStyle(color: Colors.black),
                              );
                            } else if (xvalue == 2) {
                              return Text(
                                "C",
                                style: TextStyle(color: Colors.black),
                              );
                            } else if (xvalue == 3) {
                              return Text(
                                "B",
                                style: TextStyle(color: Colors.black),
                              );
                            } else if (xvalue == 4) {
                              return Text(
                                "A",
                                style: TextStyle(color: Colors.black),
                              );
                            }
                            return Text(
                              xvalue.toInt().toString(),
                              style: TextStyle(color: Colors.black),
                            );
                          },
                        )),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(color: Colors.black),
                            );
                          },
                        )),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false))),
                    borderData: FlBorderData(
                      border: Border(
                          top: BorderSide.none,
                          right: BorderSide.none,
                          left: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.black,
                          )),
                    ),
                    barGroups: barGroupsList),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GlobalStyles.sizedBoxHeight_10,
              Text(StatisticalString.BAR_NOTE,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16)),
              GlobalStyles.sizedBoxHeight_10,
              Text(
                StatisticalString.BAR_NOTE_XAXIS,
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
              GlobalStyles.sizedBoxHeight_10,
              Text(
                StatisticalString.BAR_NOTE_YAXIS,
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
              SizedBox(
                width: 200,
                child: Divider(
                  height: 20,
                  color: Colors.grey.shade400,
                ),
              ),
              Text(
                StatisticalString.GRADE_F,
                style: TextStyle(fontSize: 13),
              ),
              GlobalStyles.sizedBoxHeight_10,
              Text(
                StatisticalString.GRADE_D,
                style: TextStyle(fontSize: 13),
              ),
              GlobalStyles.sizedBoxHeight_10,
              Text(
                StatisticalString.GRADE_C,
                style: TextStyle(fontSize: 13),
              ),
              GlobalStyles.sizedBoxHeight_10,
              Text(
                StatisticalString.GRADE_B,
                style: TextStyle(fontSize: 13),
              ),
              GlobalStyles.sizedBoxHeight_10,
              Text(
                StatisticalString.GRADE_A,
                style: TextStyle(fontSize: 13),
              ),
            ],
          )
        ],
      ),
    );
  }
}
