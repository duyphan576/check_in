import 'package:check_in/constants/app_images.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/models/statistical/statistical.dart';
import 'package:check_in/modules/statistical/controllers/statistical_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class StatisticalView extends GetView<StatisticalController> {
  const StatisticalView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticalController>(
      builder: (controller) {
        // return Obx(
        //   () => controller.isLoading.value
        //       ? Center(
        //           child: CircularProgressIndicator(),
        //         )
        //       :
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.bg,
              ),
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  "Statistical",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: AppColors.lightBlack,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: GlobalStyles.paddingAll18,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 3.5,
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
                                        value: 25,
                                        showTitle: true,
                                        title: "haha",
                                        radius: 115,
                                        color: Colors.pink),
                                    PieChartSectionData(
                                        value: 45,
                                        showTitle: true,
                                        title: "haha",
                                        radius: 115,
                                        color: Colors.pink),
                                    PieChartSectionData(
                                        value: 25,
                                        showTitle: true,
                                        title: "haha",
                                        radius: 115,
                                        color: Colors.pink),
                                    PieChartSectionData(
                                        value: 05,
                                        showTitle: true,
                                        title: "haha",
                                        radius: 115,
                                        color: Colors.pink),
                                  ]),
                            ),
                          ),
                          GlobalStyles.sizedBoxWidth_45,
                          Text("data")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
