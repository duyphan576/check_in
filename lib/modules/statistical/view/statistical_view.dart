import 'package:check_in/constants/app_images.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/pei_chart.dart';
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
        return Obx(() => controller.isLoading.value
            ? Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.bg,
                        ),
                      ),
                    ),
                    child: Center(child: CircularProgressIndicator())),
              )
            : Container(
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
                      // title: Text(
                      //   "Statistical",
                      //   style: TextStyle(color: Colors.black, fontSize: 24),
                      // ),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      iconTheme: IconThemeData(
                        color: AppColors.lightBlack,
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: GlobalStyles.paddingAll,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width / 0.78,
                              padding: GlobalStyles.paddingAll,
                              decoration: BoxDecoration(
                                color: AppColors.lightWhite.withOpacity(0.75),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black,
                                    blurRadius: 4,
                                    blurStyle: BlurStyle.outer,
                                    offset: Offset(0, 0), // Shadow position
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: AppColors.listColorGradientMain,
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              1.7,
                                      width: MediaQuery.of(context).size.width /
                                          1.8,
                                      child: PeiChartWidget(
                                        countLessThan5:
                                            controller.countLessThan5,
                                        countForm5To7: controller.countForm5To7,
                                        countForm7ToLessThan10:
                                            controller.countForm7ToLessThan10,
                                        countEqual10: controller.countEqual10,
                                      )),
                                  GlobalStyles.sizedBoxHeight_25,
                                  Text(
                                    "Pie chart depicting the percentage of students ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "in the class on the scale",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  GlobalStyles.sizedBoxHeight_25,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pie chart annotation :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      GlobalStyles.sizedBoxHeight_10,
                                      controller.countLessThan5 != 0
                                          ? TextWidget(
                                              color: Colors.red,
                                              titleStr:
                                                  "Percentage score less than 5")
                                          : Container(),
                                      GlobalStyles.sizedBoxHeight_10,
                                      controller.countForm5To7 != 0
                                          ? TextWidget(
                                              color: Colors.yellow,
                                              titleStr:
                                                  "Score percentage from 5 to less than 7")
                                          : Container(),
                                      GlobalStyles.sizedBoxHeight_10,
                                      controller.countForm7ToLessThan10 != 0
                                          ? TextWidget(
                                              color: Colors.green,
                                              titleStr:
                                                  "Score percentage from 7 to less than 10")
                                          : Container(),
                                      GlobalStyles.sizedBoxHeight_10,
                                      controller.countEqual10 != 0
                                          ? TextWidget(
                                              color: Colors.pink,
                                              titleStr:
                                                  "Point percentage equals 10")
                                          : Container(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GlobalStyles.sizedBoxHeight_25,
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width / 0.9,
                              padding: GlobalStyles.paddingAll,
                              decoration: BoxDecoration(
                                color: AppColors.lightWhite.withOpacity(0.75),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black,
                                    blurRadius: 4,
                                    blurStyle: BlurStyle.outer,
                                    offset: Offset(0, 0), // Shadow position
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: AppColors.listColorGradientMain,
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.width / 1.1,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: BarChart(
                                        BarChartData(
                                            minY: 0,
                                            maxY: controller.grades.length
                                                        .toDouble() <
                                                    10
                                                ? 10
                                                : controller.grades.length
                                                    .toDouble(),
                                            titlesData: FlTitlesData(
                                                bottomTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                  showTitles: true,
                                                  getTitlesWidget:
                                                      (value, meta) {
                                                    return Text(
                                                      value.toInt().toString(),
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    );
                                                  },
                                                )),
                                                leftTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                  showTitles: true,
                                                  getTitlesWidget:
                                                      (value, meta) {
                                                    return Text(
                                                      value.toInt().toString(),
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    );
                                                  },
                                                )),
                                                topTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                                rightTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false))),
                                            borderData: FlBorderData(
                                              border: Border(
                                                  top: BorderSide.none,
                                                  right: BorderSide.none,
                                                  left: BorderSide(
                                                      width: 1,
                                                      color: Colors.white),
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color: Colors.white)),
                                            ),
                                            barGroups: controller.barGroups),
                                      ),
                                    ),
                                  ),
                                  GlobalStyles.sizedBoxHeight_10,
                                  Text(
                                    "The chart lists the number of students ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "achieved at each point",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
      },
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
