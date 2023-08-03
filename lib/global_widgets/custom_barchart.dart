import 'package:check_in/constants/app_string.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomBarChart extends StatelessWidget {
  CustomBarChart(
      {super.key, required this.gradesLength, required this.barGroupsList});
  double gradesLength;
  List<BarChartGroupData> barGroupsList;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 180,
                          child: Text(StatisticalString.BAR_CHART,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
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
                            barTouchData: BarTouchData(
                              enabled: false,
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.transparent,
                                tooltipPadding: EdgeInsets.zero,
                                tooltipMargin: 8,
                                getTooltipItem: (
                                  BarChartGroupData group,
                                  int groupIndex,
                                  BarChartRodData rod,
                                  int rodIndex,
                                ) {
                                  return BarTooltipItem(
                                    rod.toY.round().toString() == "0"
                                        ? ""
                                        : rod.toY.round().toString(),
                                    const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ),
                            barGroups: barGroupsList,
                          ),
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
                        Row(
                          children: [
                            Icon(Icons.arrow_forward, size: 20),
                            Text(
                              StatisticalString.BAR_NOTE_XAXIS,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ],
                        ),
                        GlobalStyles.sizedBoxHeight_10,
                        Row(
                          children: [
                            Icon(Icons.arrow_upward_outlined, size: 20),
                            Text(
                              StatisticalString.BAR_NOTE_YAXIS,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
