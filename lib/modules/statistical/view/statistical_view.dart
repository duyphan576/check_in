import 'package:check_in/constants/app_images.dart';
import 'package:check_in/constants/app_string.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/bar_chart.dart';
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
                                  PeiChartWidget(
                                    countLessThan5: controller.countLessThan5,
                                    countForm5To7: controller.countForm5To7,
                                    countForm7ToLessThan10:
                                        controller.countForm7ToLessThan10,
                                    countEqual10: controller.countEqual10,
                                    pieAnouce1:
                                        StatisticalString.PieChartAnnounce,
                                    pieAnouce2:
                                        StatisticalString.PieChartAnnounce2,
                                  )
                                ],
                              ),
                            ),
                            GlobalStyles.sizedBoxHeight_25,
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width / 0.8,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  BarChartWidget(
                                      gradesLength:
                                          controller.grades.length.toDouble(),
                                      barGroupsList: controller.barGroups),
                                  GlobalStyles.sizedBoxHeight_10,
                                  Padding(
                                    padding:
                                        GlobalStyles.paddingPageLeftRight_15,
                                    child: Column(
                                      children: [
                                        Text(
                                          StatisticalString.BarChartAnnounce,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        GlobalStyles.sizedBoxHeight_10,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Bar Chart Annouce :",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 16)),
                                            GlobalStyles.sizedBoxHeight_10,
                                            Text(
                                              "X-axis represents the number of people",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            GlobalStyles.sizedBoxHeight_10,
                                            Text(
                                              "Y-axis represents the point",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
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
