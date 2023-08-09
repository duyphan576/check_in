// ignore_for_file: must_be_immutable

import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/statistical/models/statistical_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeiChartWidget extends StatelessWidget {
  PeiChartWidget({
    super.key,
    required this.listStatisticalModel,
    required this.title,
  });
  RxList<StatisticalModel> listStatisticalModel = <StatisticalModel>[].obs;
  final title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        GlobalStyles.sizedBoxHeight,
        Container(
          height: MediaQuery.of(context).size.width / 1.5,
          width: MediaQuery.of(context).size.width / 1.5,
          child: PieChart(
            PieChartData(
                centerSpaceRadius: 5,
                borderData: FlBorderData(
                  show: true,
                ),
                sectionsSpace: 2,
                sections: listStatisticalModel
                    .map((StatisticalModel statisticalModel) {
                  var index = listStatisticalModel.indexOf(statisticalModel);
                  return PieChartSectionData(
                      value: double.parse(statisticalModel.percentages!),
                      showTitle: true,
                      title: statisticalModel.nameAmountPercentages,
                      radius: 120,
                      titlePositionPercentageOffset: 0.5,
                      color: AppColors.listColorStatistical[index]);
                }).toList()),
          ),
        ),
        GlobalStyles.sizedBoxHeight,
        Container(
          height: 62,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.gray,
              width: 1,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: listStatisticalModel.length,
                  itemBuilder: (context, index) {
                    final item = listStatisticalModel[index];
                    return Container(
                      height: 60,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.gray,
                                width: 1,
                              ),
                            ),
                            child: Center(
                                child: Text(
                              item.subName ?? "",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.0,
                            )),
                            height: 30,
                            width: 100,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.gray,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                item.nameAmountPercentages ?? "",
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.0,
                              ),
                            ),
                            height: 30,
                            width: 100,
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
